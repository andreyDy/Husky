package ua.kiev.husky.dao;


import ua.kiev.husky.model.Module;

public interface ModuleDao extends GenericDao<Module> {

    Module findModuleByCourseIdAndName(int courseId, String name);

}
