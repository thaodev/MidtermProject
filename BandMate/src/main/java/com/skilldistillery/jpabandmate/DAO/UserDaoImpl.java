package com.skilldistillery.jpabandmate.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.jpabandmate.entities.Address;
import com.skilldistillery.jpabandmate.entities.TicketSale;
import com.skilldistillery.jpabandmate.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	/*
	 * CREATE
	 */

	// Add User
	@Override
	public User addUser(User user){
			// add user to user table
			em.persist(user);
		if (user.getAddress() != null) {
			em.persist(user.getAddress());
		}
		// update the local user object
		em.flush();
		return user;
	}

	/**
	 * READ
	 */
	@Override
	public User getUserByUserNameAndPassword(String userName, String password) {
		List<User> allUsers = findAllUsers();
		User u = null;
		for (User user : allUsers) {
			if (user.getUsername().equals(userName) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
		}
		return u;
	}

	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public List<User> findAllUsers() {
		List<User> users = null;
		String jpql = "SELECT u FROM User u";
		users = em.createQuery(jpql, User.class).getResultList();
		if (users != null) {
			System.out.println(users);
			return users;
		} else {
			return null;
		}
	}
	
	@Override
	public List<User> findAllUsers(int pageStart) {
		List<User> users = null;
		String jpql = "SELECT u FROM User u";
		users = em.createQuery(jpql, User.class).setFirstResult(pageStart).setMaxResults(10).getResultList();
		if (users != null) {
			System.out.println(users);
			return users;
		} else {
			return null;
		}
	}

	@Override
	public List<User> searchUserByName(String keyword) {
		List<User> users = null;
		String jpql="SELECT u FROM User u WHERE u.firstName LIKE  :keyword OR u.lastName LIKE :keyword";
		users = em.createQuery(jpql, User.class).setParameter("keyword", "%" +keyword+"%").getResultList();
		return users;
	}

	/**
	 * UPDATE
	 */
	@Override
	public boolean updateUser(User user) {
		boolean isUpdated = false;
		User updatedUser = em.find(User.class, user.getId());

		updatedUser.setAdmin(user.getAdmin());
		updatedUser.setFirstName(user.getFirstName());
		updatedUser.setLastName(user.getLastName());
		updatedUser.setUsername(user.getUsername());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setEmail(user.getEmail());
		updatedUser.setPhone(user.getPhone());
		updatedUser.setDob(user.getDob());
		updatedUser.setEnabled(user.getEnabled());
		updatedUser.setProfileImage(user.getProfileImage());

		Address updatedAddress = em.find(Address.class, user.getAddress().getId());
		if (updatedAddress != null) {
			updatedAddress.setStreet(updatedUser.getAddress().getStreet());
			updatedAddress.setCity(updatedUser.getAddress().getCity());
			updatedAddress.setState(updatedUser.getAddress().getState());
			updatedAddress.setZipCode(updatedUser.getAddress().getZipCode());
		}
		if (updatedUser != null) {
			isUpdated = true;
		}

		return isUpdated;

	}

	/**
	 * DELETE
	 */

	@Override
	public boolean deleteUser(int userId) {
		boolean isDeleted = false;
		User userToDelete = em.find(User.class, userId);

		if (userToDelete != null) {
			userToDelete.setAddress(null);
			userToDelete.setFollowedMusicians(null);
			userToDelete.setBands(null);
			userToDelete.setManagedBands(null);
			
			for (TicketSale ticket : userToDelete.getTicketPurchases()) {
				em.remove(ticket);
			}
			userToDelete.setTicketPurchases(null);
			userToDelete.setPerformanceComments(null);
			
			em.remove(userToDelete);
			isDeleted = !em.contains(userToDelete);
		}

		return isDeleted;
	}

}
