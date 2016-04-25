package ua.kiev.husky.dao;

import ua.kiev.husky.model.User;

public interface UserDao extends GenericDao<User> {

    User findByEmail(String email);

    void update(User user);

}
