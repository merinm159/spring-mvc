package com.cognizant.truyum.controller;

import java.text.ParseException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cognizant.truyum.dao.CartEmptyException;
import com.cognizant.truyum.model.MenuItem;
import com.cognizant.truyum.service.CartService;

@Controller
public class CartController {

	@Autowired
	CartService cartService;

	private static final Logger LOGGER = LoggerFactory.getLogger(CartController.class);

	@GetMapping(value = "/add-to-cart")
	public String addToCart(@RequestParam long menuItemId, ModelMap model) throws ParseException {
		LOGGER.info("Start addToCart");
		cartService.addCartItem(1, menuItemId);
		model.addAttribute("addCartStatus", true);
		LOGGER.info("Stop addToCart");
		return "menu-item-list-customer";

	}

	@GetMapping(value = "/show-cart")
	public String showCart(@RequestParam long userId, ModelMap model) {
		LOGGER.info("Start showCart()");
		List<MenuItem> cart;
		try {
			cart = cartService.getAllCartItems(userId);
			model.addAttribute("userId", userId);
			float total = 0f;
			for (MenuItem item : cart) {
				total += item.getPrice();
			}
			model.addAttribute("total", total);
			LOGGER.info("Stop showCart() try block");
			return "cart";
		} catch (CartEmptyException e) {
			// TODO Auto-generated catch block
			LOGGER.info("Stop showCart() exception");
			return "cart-empty";
		}

	}

	@GetMapping(value = "/remove-cart")
	public String removeCart(@RequestParam long menuItemId, @RequestParam long userId, ModelMap model) {
		LOGGER.info("Start removeCart()");
		cartService.removeCartItem(userId, menuItemId);
		try {
			List<MenuItem> items = cartService.getAllCartItems(userId);
			model.addAttribute("removeCartItemStatus", true);
			model.addAttribute("items", items);
			model.addAttribute("userId", userId);
			model.addAttribute("menuItemId", menuItemId);
			float total = 0f;
            for(MenuItem item : items) {
                total += item.getPrice();
            }
            model.addAttribute("total", total);
			LOGGER.info("Stop removeCart() try block");
			return "cart";
		} catch (CartEmptyException e) {
			// TODO Auto-generated catch block
			LOGGER.info("Stop removeCart() catch block");
			return "cart-empty";
		}
	}
	 @GetMapping(value = "cart")
	    public String showCart(ModelMap model) {
	        List<MenuItem> cartItems;
	        try {
	            cartItems = cartService.getAllCartItems(1);
	            model.addAttribute("cartItems", cartItems);
	            model.addAttribute("userId", 1);
	            return "cart";
	        } catch (CartEmptyException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        return "cart";
	    }
	    

}
