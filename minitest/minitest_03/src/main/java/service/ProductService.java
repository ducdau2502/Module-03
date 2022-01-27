package service;

import model.Product;

import java.util.ArrayList;
import java.util.Comparator;

public class ProductService {
   private static final ArrayList<Product> products;

    static {
        products = new ArrayList<>();
        products.add(new Product(1, "Iphone", 1000, 8, "Iphone 13 pro max"));
        products.add(new Product(2, "Samsung", 900, 2, "Samsung Z fold 3"));
        products.add(new Product(3, "Nokia", 400, 5, "Nokia lumia"));
        products.add(new Product(4, "Sony", 700, 7, "Sony walkman"));
        products.add(new Product(5, "Huawei", 800, 1, "Huawei mate 20"));
        products.add(new Product(6, "Xiaomi", 200, 6, "Xiaomi china"));
    }

    public Product getProduct(int id) {
        for (Product product: products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void createProduct(Product product) {
        products.add(product);
    }

    public void updateProduct(int index, Product product) {
        products.set(index, product);
    }

    public void deleteProduct(Product product) {
        products.remove(product);
    }

    public ArrayList<Product> sortIncrease() {
        ArrayList<Product> sortIncreaseList = new ArrayList<>(products);
        sortIncreaseList.sort(Comparator.comparingDouble(Product::getPrice));
        return sortIncreaseList;
    }

    public ArrayList<Product> sortDecrease() {
        ArrayList<Product> sortDecreaseList = new ArrayList<>(products);
        sortDecreaseList.sort(Comparator.comparing(Product::getPrice).reversed());
        return sortDecreaseList;
    }
}
