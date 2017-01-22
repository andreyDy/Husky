package ua.kiev.husky.dao;

import ua.kiev.husky.model.Course;


public interface CourseDao extends GenericDao<Course> {

    Course findByName(String courseName);

}
