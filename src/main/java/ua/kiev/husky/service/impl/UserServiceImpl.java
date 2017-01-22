package ua.kiev.husky.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.kiev.husky.dao.CourseDao;
import ua.kiev.husky.dao.UserDao;
import ua.kiev.husky.exception.EmailExistsException;
import ua.kiev.husky.model.Course;
import ua.kiev.husky.model.User;
import ua.kiev.husky.service.UserService;

import java.util.Set;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private CourseDao courseDao;

    @Override
    @Transactional
    public void registerUser(User user) {
        if (emailExists(user.getEmail())) {
            throw new EmailExistsException("The email address: " + user.getEmail() +
                    " is already in use.");
        }
        userDao.save(user);
    }

    private boolean emailExists(String email) {
        try {
            userDao.findByEmail(email);
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    @Override
    @Transactional
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    @Transactional
    public void update(User user) {
        User oldUser = findByEmail(user.getEmail());
        oldUser.setBirthday(user.getBirthday());
        oldUser.setLastName(user.getLastName());
        oldUser.setFirstName(user.getFirstName());
        oldUser.setPassword(user.getPassword());
        userDao.update(oldUser);
    }

    @Override
    @Transactional
    public User findById(int id) {
        return userDao.findById(id);
    }

    @Override
    @Transactional
    public void addCourse(int userId, int courseId) {
        User user = userDao.findById(userId);
        user.getCourses().add(courseDao.findById(courseId));
        userDao.update(user);
    }

    @Override
    @Transactional
    public boolean enrollInCourse(int userId, int courseId) {
        Course course = courseDao.findById(courseId);
        Set<User> participants = course.getParticipants();
        if (participants.contains(userDao.findById(userId))) {
            return true;
        }
        return false;
    }

    @Override
    @Transactional
    public Set<Course> findCourses(int id) {
        return userDao.findById(id).getCourses();
    }

}
