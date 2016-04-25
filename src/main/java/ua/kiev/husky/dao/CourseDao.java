package ua.kiev.husky.dao;

import ua.kiev.husky.model.Course;

import java.util.List;


public interface CourseDao extends GenericDao<Course> {

    Course findByName(String courseName);

}
