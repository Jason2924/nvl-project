package com.demo.controllers.admin;

import java.io.File;
import java.io.Serializable;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Account;
import com.demo.entities.Photo;
import com.demo.entities.Price;
import com.demo.entities.Product;
import com.demo.services.BrandService;
import com.demo.services.CategoryService;
import com.demo.services.PhotoService;
import com.demo.services.PriceService;
import com.demo.services.ProductService;
import com.google.common.collect.Lists;
import com.google.gson.Gson;

@Controller
@RequestMapping("admin/product")
public class AdminProductController implements ServletContextAware {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private PriceService priceService;
	@Autowired
	private PhotoService photoService;

	private ServletContext servletContext;

	@RequestMapping(value = "phone", method = RequestMethod.GET)
	public String phone(ModelMap modelMap) {
		try {
			// get max id of products
			modelMap.put("newId", productService.findMaxId() + 1);
			// create brands for spring form
			modelMap.put("brands", brandService.findAll(true));
			// create new productTotal for spring form
			ProductTotal productTotal = new ProductTotal();
			productTotal.setProduct(new Product());
			modelMap.put("productTotal", productTotal);
			// display list products
			modelMap.put("phones", productService.findByCategory(categoryService.findById(1), true));
			modelMap.put("account", new Account());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.product.phone";
	}

	@RequestMapping(value = "accessory", method = RequestMethod.GET)
	public String accessories(ModelMap modelMap) {
		try {
			// get max id of products
			modelMap.put("newId", productService.findMaxId() + 1);
			// create brands for spring form
			modelMap.put("brands", brandService.findAll(true));
			// create new productTotal for spring form
			ProductTotal productTotal = new ProductTotal();
			productTotal.setProduct(new Product());
			modelMap.put("productTotal", productTotal);
			// display list products
			modelMap.put("accessories", productService.findByCategory(categoryService.findById(2), true));
		} catch (Exception e) {
			System.err.println(e);
			e.printStackTrace();
		}
		return "admin.product.accessory";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("productTotal") ProductTotal productTotal,
			@RequestParam("isPhone") int isPhone, @RequestParam("newId") int newId) {
		try {
			// set product
			Product product = productTotal.getProduct();
			if (isPhone == 1) {
				product.setCategory(categoryService.findById(1));
			} else {
				product.setCategory(categoryService.findById(2));
			}
			product.setRate((float) 0);
			product.setStatus(true);
			// set photo for product
			List<String> photoNames = new ArrayList<>();
			for (int i = 0; i < productTotal.getMultipartFiles().size(); ++i) {
				String photoName = "";
				if (i == 0) {
					photoName += newId + "_front";
					photoName += saveFile(productTotal.getMultipartFiles().get(i), photoName);
					product.setPhoto(photoName);
				} else if (i == 1) {
					photoName += newId + "_rear";
					photoName += saveFile(productTotal.getMultipartFiles().get(i), photoName);
				} else {
					photoName += newId + "_back";
					photoName += saveFile(productTotal.getMultipartFiles().get(i), photoName);
				}
				photoNames.add(photoName);
			}
			productService.save(product);
			// set price for product
			Price price = new Price();
			price.setPrice(productTotal.getPrice());
			price.setStatus(true);
			price.setProduct(product);
			priceService.save(price);
			// set photos for product
			for (String photoName : photoNames) {
				Photo photo = new Photo();
				photo.setPhoto(photoName);
				photo.setProduct(product);
				photo.setStatus(true);
				photoService.save(photo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (isPhone == 1) {
			return "redirect:phone";
		} else {
			return "redirect:accessory";
		}

	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam("productId") int id, @RequestParam("isPhone") int isPhone) {
		try {
			// find product
			Product product = productService.findById(id);
			// find photos
			List<String> photos = new ArrayList<>();
			for (Photo photo : product.getPhotos()) {
				photos.add(photo.getPhoto());
			}
			// sort photos
			Collections.sort(photos);
			// find brand
			int brandId = product.getBrand().getId();
			// find price
			double price = priceService.findByProductId(product.getId(), true).getPrice();
			// find configuration
			List<String> configs = new ArrayList<>();
			if (isPhone == 1) {
				if (!product.getConfiguration().equals("")) {
					String[] c = product.getConfiguration().split(",");
					for (int i = 0; i < c.length; ++i) {
						configs.add(c[i]);
					}
				}
			} else {
				configs.add(product.getConfiguration());
			}
			HashMap<String, Object> hashMap = new HashMap<>();
			hashMap.put("product", productService.findForAjax(id, 1).get(0));
			hashMap.put("photos", photos);
			hashMap.put("price", price);
			hashMap.put("brandId", brandId);
			hashMap.put("configs", configs);
			return new Gson().toJson(hashMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("productTotal") ProductTotal productTotal,
			@RequestParam("isPhone") int isPhone) {
		try {
			Product p = productTotal.getProduct();
			Product product = productService.findById(p.getId());
			// update non-relative properties
			product.setName(p.getName());
			product.setQuantity(p.getQuantity());
			product.setDescription(p.getDescription());
			product.setConfiguration(p.getConfiguration());
			if (isPhone == 1) {
				product.setCategory(categoryService.findById(1));
			} else {
				product.setCategory(categoryService.findById(2));
			}
			// update brand
			product.setBrand(p.getBrand());
			productService.save(product);
			// update photos for product
			List<Photo> photos = Lists.newArrayList(product.getPhotos());
			for (int i = 0; i < productTotal.getMultipartFiles().size(); ++i) {
				// check not updating photo
				if (!productTotal.getMultipartFiles().get(i).isEmpty()) {
					// set name base on index
					String photoName = "";
					if (i == 0) {
						photoName = p.getId() + "_front";
						photoName += saveFile(productTotal.getMultipartFiles().get(i), photoName);
						product.setPhoto(photoName);
						// find and replace image_front in photos
						for (Photo photo : photos) {
							if (photo.getPhoto().contains("front")) {
								photo.setPhoto(photoName);
								photoService.save(photo);
							}
						}
					} else if (i == 1) {
						photoName = p.getId() + "_rear";
						photoName += saveFile(productTotal.getMultipartFiles().get(i), photoName);
						// find and replace image_rear in photos
						for (Photo photo : photos) {
							if (photo.getPhoto().contains("rear")) {
								photo.setPhoto(photoName);
								photoService.save(photo);
							}
						}
					} else {
						photoName = p.getId() + "_back";
						photoName += saveFile(productTotal.getMultipartFiles().get(i), photoName);
						// find and replace image_back in photos
						for (Photo photo : photos) {
							if (photo.getPhoto().contains("back")) {
								photo.setPhoto(photoName);
								photoService.save(photo);
							}
						}
					}
				}
			}
			// set old price status to false
			priceService.findByProductId(product.getId(), true).setStatus(false);
			// set new price for product
			Price price = new Price();
			price.setPrice(productTotal.getPrice());
			price.setStatus(true);
			price.setProduct(product);
			priceService.save(price);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (isPhone == 1) {
			return "redirect:phone";
		} else {
			return "redirect:accessory";
		}

	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id) {
		// set status to false
		Product product = new Product();
		try {
			product = productService.findById(id);
			product.setStatus(false);
			productService.save(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (product.getCategory().getId() == 1) {
			return "redirect:phone";
		} else {
			return "redirect:accessory";
		}
	}

	private String saveFile(MultipartFile multipartFile, String fileName) {
		try {
			byte[] bytes = multipartFile.getBytes();
			String extension = multipartFile.getOriginalFilename()
					.substring(multipartFile.getOriginalFilename().length() - 4);
			Path path = Paths.get(servletContext.getRealPath("/upload/images/products/" + fileName + extension));
			File file = new File(path.toString());
			// check if photo exists
			if (file.exists()) {
				file.delete();
			}
			Files.write(path, bytes);
			return extension;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	@RequestMapping(value = "ajaxProductSort", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxProductSort(@RequestParam("header") String header, @RequestParam("turn") int turn,
			@RequestParam("isPhone") int isPhone) {
		try {
			List<ProductJson> productJsons = new ArrayList<>();
			List<Product> products = new ArrayList<>();
			if (isPhone == 1) {
				products = productService.findByCategory(categoryService.findById(1), true);
			} else {
				products = productService.findByCategory(categoryService.findById(2), true);
			}
			for (Product product : products) {
				ProductJson productJson = new ProductJson();
				productJson.setId(product.getId());
				productJson.setPhoto(product.getPhoto());
				productJson.setName(product.getName());
				double price = priceService.findByProductId(product.getId(), true).getPrice();
				productJson.setPrice(price);
				productJson.setQuantity(product.getQuantity());
				productJsons.add(productJson);
			}
			switch (header) {
			case "thName":
				if (turn == 0) {
					Collections.sort(productJsons, new ProductNameSort());
				} else {
					Collections.sort(productJsons, new ProductNameSort().reversed());
				}
				break;
			case "thPrice":
				if (turn == 0) {
					Collections.sort(productJsons, new ProductPriceSort());
				} else {
					Collections.sort(productJsons, new ProductPriceSort().reversed());
				}
				break;
			case "thQuantity":
				if (turn == 0) {
					Collections.sort(productJsons, new ProductQuantitySort());
				} else {
					Collections.sort(productJsons, new ProductQuantitySort().reversed());
				}
				break;
			}
			return new Gson().toJson(productJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}

// temp ObjetClass to store product + price + configuration + photos
class ProductTotal {
	private Product product;
	private double price;
	private List<MultipartFile> multipartFiles;

	public ProductTotal(Product product, double price, List<MultipartFile> multipartFiles) {
		super();
		this.product = product;
		this.price = price;
		this.multipartFiles = multipartFiles;
	}

	public ProductTotal() {
		super();
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public List<MultipartFile> getMultipartFiles() {
		return multipartFiles;
	}

	public void setMultipartFiles(List<MultipartFile> multipartFiles) {
		this.multipartFiles = multipartFiles;
	}

}

// temp JsonClass to store needed data
class ProductJson implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String photo;
	private String name;
	private double price;
	private int quantity;

	public ProductJson(int id, String photo, String name, double price, int quantity) {
		super();
		this.id = id;
		this.photo = photo;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public ProductJson() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNamePhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}

// comparing classes
class ProductNameSort implements Comparator<ProductJson> {

	@Override
	public int compare(ProductJson productJson1, ProductJson productJson2) {
		return productJson1.getName().compareTo(productJson2.getName());
	}

}

class ProductPriceSort implements Comparator<ProductJson> {

	@Override
	public int compare(ProductJson productJson1, ProductJson productJson2) {
		if (productJson1.getPrice() > productJson2.getPrice()) {
			return -1;
		} else if (productJson1.getPrice() == productJson2.getPrice()) {
			return 0;
		} else {
			return 1;
		}
	}

}

class ProductQuantitySort implements Comparator<ProductJson> {

	@Override
	public int compare(ProductJson productJson1, ProductJson productJson2) {
		if (productJson1.getQuantity() > productJson2.getQuantity()) {
			return -1;
		} else if (productJson1.getQuantity() == productJson2.getQuantity()) {
			return 0;
		} else {
			return 1;
		}
	}

}