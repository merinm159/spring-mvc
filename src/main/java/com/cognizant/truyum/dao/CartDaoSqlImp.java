package com.cognizant.truyum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.cognizant.truyum.controller.CartController;
import com.cognizant.truyum.model.Cart;
import com.cognizant.truyum.model.MenuItem;

@Component("cartDao")
public class CartDaoSqlImp implements CartDao {
	private static PreparedStatement preparedStatement = null;
	private static final Logger LOGGER = LoggerFactory.getLogger(CartController.class);

	@Override
	public void addCartItem(long userId, long menuItemId) {
		LOGGER.info("Start addCartItem");
		try {

			Connection connection = ConnectionHandler.getConnection();

			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO CART(CT_USER_ID, CT_MENU_ID) VALUES (?, ?)");
			preparedStatement.setLong(1, userId);
			preparedStatement.setLong(2, menuItemId);

			if (preparedStatement.executeUpdate() > 0) {
				System.out.println("Query Successful");
			} else {
				System.out.println("Query Unsuccessful");
			}
			preparedStatement.clearParameters();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		LOGGER.info("Stop addCartItem");
	}

	@Override
	public List<MenuItem> getAllCartItems(long userId) throws CartEmptyException {
		LOGGER.info("Start getAllCartItems");
		List<MenuItem> menuItemList = new ArrayList<>();
		Cart cart = new Cart(menuItemList, 0);
		double total = 0;
		try {
			Connection connection = ConnectionHandler.getConnection();

			PreparedStatement prepareStatement = connection.prepareStatement(
					"SELECT * FROM MENU_ITEMS WHERE ID IN (SELECT CT_MENU_ID FROM CART WHERE CT_USER_ID = ?)");

			prepareStatement.setLong(1, userId);

			ResultSet resultSet = prepareStatement.executeQuery();

			while (resultSet.next()) {
				long id = resultSet.getLong(1);
				String name = resultSet.getString(2);
				float price = resultSet.getFloat(3);
				total += price;
				boolean active = resultSet.getInt(4) == 1;
				Date dateOfLaunch = resultSet.getDate(5);
				String category = resultSet.getString(6);
				boolean freeDelivery = resultSet.getInt(7) == 1;
				MenuItem menuItem = new MenuItem(id, name, price, active, dateOfLaunch, category, freeDelivery);
				menuItemList.add(menuItem);
			}
			preparedStatement.clearParameters();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cart.setMenuItemList(menuItemList);
		cart.setTotal(total);
		LOGGER.info("Stop getAllCartItems");
		return menuItemList;
	}

	@Override
	public void removeCartItem(long userId, long menuItemId) {
		LOGGER.info("Start removeCartItem");
		try {
			Connection connection = ConnectionHandler.getConnection();

			PreparedStatement prepareStatement = connection
					.prepareStatement("DELETE FROM CART WHERE CT_MENU_ID = ? AND CT_USER_ID = ?");
			prepareStatement.setLong(1, menuItemId);
			prepareStatement.setLong(2, userId);

			if (prepareStatement.executeUpdate() > 0) {
				System.out.println("Query Successful");
			} else {
				System.out.println("Query Unsuccessful");
			}
			preparedStatement.clearParameters();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		LOGGER.info("Stop removeCartItem");
	}

}