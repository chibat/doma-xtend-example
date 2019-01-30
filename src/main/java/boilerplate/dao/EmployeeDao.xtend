package boilerplate.dao;

import java.util.List;

import org.seasar.doma.Dao;
import org.seasar.doma.Delete;
import org.seasar.doma.Insert;
import org.seasar.doma.Select;
import org.seasar.doma.Update;

import boilerplate.AppConfig;
import boilerplate.entity.Employee;
import org.seasar.doma.experimental.Sql

@Dao(config = AppConfig)
interface EmployeeDao {

    @Sql("
        select
            /*%expand*/*
        from
            employee
        order by id
    ")
    @Select
    def List<Employee> selectAll();

    @Sql("
        select
            /*%expand*/*
        from
            employee
        where
            id = /* id */0
    ")
    @Select
    def Employee selectById(Integer id);

    @Insert
    def int insert(Employee employee);

    @Update
    def int update(Employee employee);

    @Delete
    def int delete(Employee employee);
}
