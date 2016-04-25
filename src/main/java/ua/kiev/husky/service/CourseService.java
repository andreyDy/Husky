package ua.kiev.husky.service;

import ua.kiev.husky.model.Course;
import ua.kiev.husky.model.Module;

import java.util.List;


public interface CourseService {

    void createCourse(Course course);

    Course findById(int id);

    List<Course> findAll();

    void addModule(Module module, int courseId);

    Module findModuleById(int id);

}
