package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model.Cart;
import com.model.Medicine;
import com.model.User;

import bdUtil.DbConnect;

@Controller
public class EcommerceController {

	@RequestMapping(value = "/medicineEcommerce", method = RequestMethod.GET)
	public String getAllMedicines(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		List<Medicine> med = new ArrayList<>();
		Connection connection = DbConnect.openConnection();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.prepareStatement("SELECT * FROM medicines");
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Medicine medicine = new Medicine();
				medicine.setMedicineId(resultSet.getInt("id"));
				medicine.setName(resultSet.getString("name"));
				medicine.setPrice(resultSet.getDouble("price"));
				medicine.setDescription(resultSet.getString("description"));
				medicine.setCategory(resultSet.getString("category"));
				med.add(medicine);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (statement != null) {
					statement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		/* ModelAndView mav = new ModelAndView(); */
		/* mav.addObject("medicines", med); */
		model.addAttribute("medicines", med);
		return "medicineEcommerce";

	}

	@RequestMapping(value = "/medicineEcommerce/{medicine_id}")
	public ModelAndView viewMedicine(@PathVariable("medicine_id") int id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			mav.setViewName("redirect:/");
		}
		Connection conn = DbConnect.openConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Medicine medicine = null;

		try {

			stmt = conn.prepareStatement("SELECT * FROM medicines WHERE id = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();

			if (rs.next()) {
				medicine = new Medicine();
				medicine.setMedicineId(rs.getInt("id"));
				medicine.setName(rs.getString("name"));
				medicine.setPrice(rs.getDouble("price"));
				medicine.setDescription(rs.getString("description"));
				medicine.setCategory(rs.getString("category"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		mav.addObject("medicine", medicine);
		mav.setViewName("viewMedicine");
		return mav;
	}

	@RequestMapping(value = "/medicineEcommerce/{medicine_id}/{quantity}")
	public ModelAndView addToCart(@PathVariable("medicine_id") int id, @PathVariable("quantity") int qtc,
			HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			modelAndView.setViewName("redirect:/");
		}
		Connection conn = DbConnect.openConnection();
		PreparedStatement stmt = null;
		PreparedStatement stmt2 = null;
		ResultSet rs = null;
//	    Cart cart=new Cart();
		Medicine medicine = new Medicine();
		try {

			stmt = conn.prepareStatement("SELECT * FROM medicines WHERE id = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();

			if (rs.next()) {
				medicine = new Medicine();
				medicine.setMedicineId(rs.getInt("id"));
				medicine.setName(rs.getString("name"));
				medicine.setPrice(rs.getDouble("price"));
				medicine.setDescription(rs.getString("description"));
				medicine.setCategory(rs.getString("category"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		stmt = null;
		Double totalPrice = qtc * medicine.getPrice();
		Cart cart = new Cart();
		cart.setPrice(totalPrice);
		cart.setQuantity(qtc);
		cart.setMedicine(medicine);
		try {

			stmt2 = conn.prepareStatement("insert into cart (quantity,price,medicine_id,user_id) values (?,?,?,?)");
			stmt2.setInt(1, qtc);

			stmt2.setDouble(2, totalPrice);
			stmt2.setInt(3, medicine.getMedicineId());
			stmt2.setInt(4, 1);
			stmt2.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt2 != null) {
					stmt2.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		modelAndView.setViewName("redirect:/medicineEcommerce");
		modelAndView.addObject("medicine", medicine);
		modelAndView.addObject("cart", cart);

		return modelAndView;

	}

	@RequestMapping(value = "/cart")
	public String viewCart(HttpServletRequest request, Model model) {
		/* ModelAndView modelAndView = new ModelAndView(); */
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		Connection conn = DbConnect.openConnection();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Cart> cartList = new ArrayList<>();

		try {
			stmt = conn.prepareStatement(
					"SELECT c.id,c.quantity,c.price AS totalPrice, m.name,m.description,m.price AS price,m.category "
							+ "FROM cart c " + "INNER JOIN medicines m ON c.medicine_id=m.id");
//	        stmt.setInt(1, 1);
			rs = stmt.executeQuery();

			while (rs.next()) {

				Cart cart = new Cart();
				cart.setPrice(rs.getDouble("totalPrice"));
				cart.setQuantity(rs.getInt("quantity"));
				cart.setId(rs.getInt("id"));

				Medicine medicine = new Medicine();
				medicine.setName(rs.getString("name"));
				medicine.setPrice(rs.getDouble("price"));
				medicine.setDescription(rs.getString("description"));
				medicine.setCategory(rs.getString("category"));
				cart.setMedicine(medicine);
				cartList.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		/*
		 * modelAndView.setViewName("cart"); modelAndView.addObject("cartList",
		 * cartList);
		 */
		model.addAttribute("cartList", cartList);
		return "cart";

	}

	@RequestMapping(value = "/checkout", method = RequestMethod.POST)
	public ModelAndView checkoutCart(@RequestParam("checkedCart") List<Integer> cartIds, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			modelAndView.setViewName("redirect:/");
		}
		List<Cart> cartList = new ArrayList<>();
		Double checkoutPrice = 0.0;
		StringBuilder cartIdsStr = new StringBuilder();
		for (int i = 0; i < cartIds.size(); i++) {
			cartIdsStr.append(cartIds.get(i));
			if (i != cartIds.size() - 1) {
				cartIdsStr.append(",");
			}
		}

		try (Connection conn = DbConnect.openConnection();
				PreparedStatement stmt = conn.prepareStatement("SELECT c.id, c.quantity, c.price AS totalPrice, "
						+ "m.name, m.description, m.price AS price, m.category " + "FROM cart c "
						+ "INNER JOIN medicines m ON c.medicine_id = m.id " + "WHERE c.id IN (" + cartIdsStr + ")")) {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Cart cart = new Cart();
				cart.setPrice(rs.getDouble("totalPrice"));
				checkoutPrice = checkoutPrice + rs.getDouble("totalPrice");
				cart.setQuantity(rs.getInt("quantity"));
				cart.setId(rs.getInt("id"));

				Medicine medicine = new Medicine();
				medicine.setName(rs.getString("name"));
				medicine.setPrice(rs.getDouble("price"));
				medicine.setDescription(rs.getString("description"));
				medicine.setCategory(rs.getString("category"));
				cart.setMedicine(medicine);
				cartList.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		checkoutPrice = (Double) (Math.round(checkoutPrice * 100.0) / 100.0);
		modelAndView.addObject("checkoutPrice", checkoutPrice);
		modelAndView.setViewName("checkout");
		modelAndView.addObject("cartList", cartList);

		return modelAndView;

	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}

}
