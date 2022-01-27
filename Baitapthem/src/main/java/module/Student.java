package module;

public class Student {
    private int id;
    private String name;
    private int age;
    private String address;
    private double avgPoint;

    public Student() {
    }

    public Student(int id, String name, int age, String address, double avgPoint) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.address = address;
        this.avgPoint = avgPoint;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getAvgPoint() {
        return avgPoint;
    }

    public void setAvgPoint(double avgPoint) {
        this.avgPoint = avgPoint;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", address='" + address + '\'' +
                ", avgPoint=" + avgPoint +
                '}';
    }
}
