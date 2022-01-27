package service;

import module.Student;

import java.util.ArrayList;
import java.util.Comparator;

public class StudentService {
    private static final ArrayList<Student> students;

    static {
        students = new ArrayList<>();
        students.add(new Student(1, "Hào", 18, "NA", 8.7));
        students.add(new Student(2, "Tiến", 24, "BN", 9.3));
        students.add(new Student(3, "Quang", 20, "PT", 7.5));
        students.add(new Student(4, "Đức", 21, "HN", 8.5));
    }

    public Student getStudent(int id) {
        for (Student student : students) {
            if (student.getId() == id) {
                return student;
            }
        }
        return  null;
    }

    public void addStudent(Student student) {
        students.add(student);
    }

    public void deleteStudent(Student student) {
        students.remove(student);
    }

    public void editStudent(int index, Student student) {
        students.set(index, student);
    }

    public ArrayList<Student> displayAllStudent() {
        return students;
    }

    public ArrayList<Student> searchStudent(String name) {
        ArrayList<Student> listSearch = new ArrayList<>();
        for (Student student : students) {
            if (student.getName().equalsIgnoreCase(name)) {
                listSearch.add(student);
            }
        }
        return listSearch;
    }

    public ArrayList<Student> sortStudent() {
        ArrayList<Student> listSort = new ArrayList<>(students);
        listSort.sort(Comparator.comparingDouble(Student::getAvgPoint));
        return listSort;
    }


}
