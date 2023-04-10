package com.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.model.User;
import com.model.Post;

import bdUtil.DbConnect;

@Controller
public class CommunityController {

	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String checkStressLevel(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		// Retrieve list of posts from database
		List<Post> posts = new ArrayList<Post>();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DbConnect.openConnection();
			String sql = "SELECT post.*, user.username FROM post JOIN user ON post.userID = user.id";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Post post = new Post();
				post.setId(rs.getInt("id"));
				post.setAuthor(rs.getString("username"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setViewCount(rs.getInt("viewCount"));
				post.setLastPost(rs.getTimestamp("lastPost"));
				post.setUserID(rs.getInt("userID"));
				posts.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		model.addAttribute("posts", posts);
		return "community";
	}

	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String viewPost(@PathVariable("id") int id, HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}

		try (Connection con = DbConnect.openConnection();) {
			String sql = "SELECT * FROM post WHERE id=?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			Post post = new Post();

			while (rs.next()) {
				post.setId(rs.getInt("id"));
				/* post.setAuthor(rs.getString("author")); */
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setViewCount(rs.getInt("viewCount"));
				post.setLastPost(rs.getTimestamp("lastPost"));
				post.setUserID(rs.getInt("userID"));
			}

			model.addAttribute("post", post);

			sql = "UPDATE post SET viewCount=viewCount+1 WHERE id=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("Error occurred while accessing database.");
		}
		return "viewPost";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createPost(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}
		return "addPost";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String addPost(@ModelAttribute("post") Post post, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			return "redirect:/";
		}

		try {
			User user = (User) session.getAttribute("user");
			Connection con = DbConnect.openConnection();
			String sql = "INSERT INTO post (title, content, viewCount, userID) VALUES (?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, post.getTitle());
			stmt.setString(2, post.getContent());
			stmt.setInt(3, 0);
			stmt.setInt(4, user.getId());

			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("Error Occurred while accessing database.");
		}
		return "redirect:/community";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String editPost(@PathVariable("id") int id, HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			Connection conn = DbConnect.openConnection();
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM post WHERE id = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Post post = new Post();
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setViewCount(rs.getInt("viewCount"));
				post.setLastPost(rs.getTimestamp("lastPost"));
				post.setUserID(rs.getInt("id"));
				model.addAttribute("post", post);
			}
			return "editPost";
		} else {
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String updatePost(@PathVariable("id") int id, @ModelAttribute("post") Post post, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Connection conn = DbConnect.openConnection();
		PreparedStatement stmt = conn.prepareStatement("UPDATE post SET title = ?, content = ? WHERE id = ?");
		stmt.setString(1, request.getParameter("title"));
		stmt.setString(2, request.getParameter("content"));
		stmt.setInt(3, id);
		stmt.executeUpdate();
		return "redirect:/community";
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deletePost(@PathVariable("id") int id, HttpServletRequest request) throws Exception {
		Connection conn = DbConnect.openConnection();
		PreparedStatement stmt = conn.prepareStatement("DELETE FROM post WHERE id = ?");
		stmt.setInt(1, id);
		stmt.executeUpdate();
		return "redirect:/community";
	}

	@ModelAttribute
	public void addAttributes(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
	}
}