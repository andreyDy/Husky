package ua.kiev.husky.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.kiev.husky.dao.CourseDao;
import ua.kiev.husky.dao.ModuleDao;
import ua.kiev.husky.exception.NameExistsException;
import ua.kiev.husky.model.Course;
import ua.kiev.husky.model.Module;
import ua.kiev.husky.service.CourseService;

import java.util.List;


@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseDao courseDao;

    @Autowired
    private ModuleDao moduleDao;

    @Override
    @Transactional
    public void createCourse(Course course) {
        if (courseNameExists(course.getName())) {
            throw new NameExistsException("The course name: " +
                    course.getName() + " is already in use.");
        }
        courseDao.save(course);
    }

    private boolean courseNameExists(String courseName) {
        try {
            courseDao.findByName(courseName);
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    @Override
    @Transactional
    public Course findById(int id) {
        return courseDao.findById(id);
    }

    @Override
    @Transactional
    public List<Course> findAll() {
        return courseDao.findAll();
    }

    @Override
    @Transactional
    public void addModule(Module module, int courseId) {
        if (moduleNameInCourseExists(module.getName(), courseId)) {
            throw new NameExistsException("The module name: " +
                    module.getName() + " is already in use.");
        }
        Course course = courseDao.findById(courseId);
        module.setCourse(course);
        moduleDao.save(module);
    }

    @Override
    @Transactional
    public Module findModuleById(int id) {
        return moduleDao.findById(id);
    }

    private boolean moduleNameInCourseExists(String moduleName, int courseId) {
        try {
            moduleDao.findModuleByCourseIdAndName(courseId, moduleName);
            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

}
