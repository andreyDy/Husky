package ua.kiev.husky.service;

import ua.kiev.husky.model.Course;
import ua.kiev.husky.model.User;

import java.util.Set;


public interface UserService {

    void registerUser(User user);

    User findByEmail(String email);

    void update(User user);

    User findById(int id);

    void addCourse(int userId, int courseId);

    boolean enrollInCourse(int userId, int courseId);

    Set<Course> findCourses(int id);

}
