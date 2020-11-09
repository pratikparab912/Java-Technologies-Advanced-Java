package annotation_app;

import java.lang.annotation.Annotation;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Field;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@interface MyTable{
	String name();
}

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@interface MyColumn{
	String name();
	String type();
	int length();
}

@MyTable(name = "emp")
class Emp{
	
	@MyColumn(name = "emp_id",type = "int",length = 12)
	int empId;
	
	@MyColumn(name = "emp_name",type = "varchar",length = 35)
	String empName;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}
		
}

class MyHbm{
	void configureHbm(Class type) {
		MyTable anno = (MyTable)type.getDeclaredAnnotation(MyTable.class);
		String tableName = anno.name();
//		System.out.println("Table Name : "+tableName); 
		
		Field ar[] = type.getDeclaredFields();
		String s = "";
		for(Field f : ar) {
			MyColumn mcol = f.getDeclaredAnnotation(MyColumn.class);
			String nm = mcol.name();
			String ty = mcol.type();
			int size = mcol.length();
			s += nm+" "+ty+"("+size+")";
			s +=",";
		}
		s = s.substring(0,s.length()-1);
		
		s = "create table "+tableName+"("+s+")";
		System.out.println(s);
	}
}


public class Main {

	public static void main(String[] args) {
		MyHbm m = new MyHbm();
		
		
		
		
		
		m.configureHbm(Emp.class); 
	}

}
