package newmscwebsite

import grails.converters.JSON
import groovy.sql.Sql

class ProductController {

    static final RAND = new Random()
	
    def index() { }
	def dataSource
	
	def addProduct(){
		
		 
		
		
	}
	
	def saveProduct(){
		
		
		println("params inside saveProduct ::::::::::::::"+params)
		
		//println("params ::: uploadImage/HomeController::*******************::::"+params)
		def unit_price 
		
		if(params.product_name  && params.product_title && params.product_description && params.unit_price && params.quantity){
		
			unit_price = params.unit_price.replace(" ","")
			 def file = request.getFile('file1')
		 
		 
		 //println("file ::::::::::"+file)
		 
		 def imageurl = grailsApplication.config.grails.config.filesUpload
		 println("imageurl :::::::::::::::"+imageurl)
		 new File(imageurl).mkdirs()
		 
		 def bathRoomFacility = ""
		 
		 def key = new UUID(System.currentTimeMillis(),
			 (System.currentTimeMillis() * System.currentTimeMillis() + RAND.nextInt(10000)) as long);
   
			key = "" + key + ".png"
		
			imageurl=imageurl+key
		   
				 try{
				 File _file = new File(imageurl)
				 
						if (file && !file?.empty) {
						  
						 file.transferTo(_file)
						}
				 } catch (Exception e) {
			
			 }
				
				// println("imageurl :::::::::::::"+imageurl)
				 def image_url = "imageFile/"+key
				 
				// println("imageurl :::::::::::::"+imageurl)
				 def product_inst 
				 
				 if(params.promotional_price){
				 
				 product_inst = new Product(productName:params.product_name,productTitle:params.product_title,
												productDescription:params.product_description,unitPrice:unit_price,
												promotionalPrice:params.promotional_price,productImageUrl:image_url,quantity:params.quantity)
				 }else{
				   product_inst = new Product(productName:params.product_name,productTitle:params.product_title,
					   							productDescription:params.product_description,unitPrice:unit_price,
												  productImageUrl:image_url,quantity:params.quantity)
				 
				 }
				
				if(product_inst.save()){
					
					//println("product_inst ::::::::::"+product_inst)

			      redirect(controller:"product",action:"productList")
				}else{
				 // println("product_inst ::not saved::::::::")
				  redirect(controller:"home",action:"index")
				
				}
			   
		}else{
		
		       flash.message = "All fields are required."
		  
			   redirect(controller:"product",action:"addProduct")
		
		}
	}
	
	def updateProduct(){
		
		  println("params inside update_product ::::::::::::"+params)
		  
		 // [product_title:Allen Solly, product_name:Shirt, promotional_price:$10, 
		  //quantity:2, product_description:This is avery good product of lee having different colors and design,
		  // unit_price:$ 50, file1:org.springframework.web.multipart.commons.CommonsMultipartFile@1d87f52,
		  // action:updateProduct, controller:product]
		  
		  def imageurl = request.getSession().getServletContext().getRealPath("/").toString()+"imageFile/"
		  
		  println(":::::::::::::::::::"+imageurl)
		  
		  def product_inst = Product.get(params.product_id)
		  
		  def image_name = product_inst.productImageUrl.replace("imageFile/","")
		  
//		  if(params.product_name  && params.product_title && params.product_description && params.unit_price && params.quantity){
			  
			  
			 
			  def file = request.getFile('file1')
			  
			  println("file ::::original file nameeeeeeeeeee::::::"+file.getOriginalFilename())
			  
		if(file.getOriginalFilename() != ""){
			  
			  
			  File folder = new File(imageurl);
			  File[] listOfFiles = folder.listFiles();
			  def fileName
			  
			  
			  
			  
			  for (File file1 : listOfFiles) {
				  if (file1.isFile()) {
					  fileName = file1.getName()
					  println("file fileName "+fileName)
					  if(fileName == image_name){
						  
						  println("file name matcheddddddddddddddddddddddddddddddddddd")
						  file1.delete()
					  }
					  
				  }
			   }
			  
			  
			  
					  
			  
			  println("imageurl :::::::::::::::"+imageurl)
			  new File(imageurl).mkdirs()
			  
			  def key = new UUID(System.currentTimeMillis(),
				  (System.currentTimeMillis() * System.currentTimeMillis() + RAND.nextInt(10000)) as long);
		
				 key = "" + key + ".png"
			 
				 imageurl=imageurl+key
				
					  try{
						  File _file = new File(imageurl)
						  
								 if (file && !file?.empty) {
									// println("inside image fileeeeeeeeeeeeeeeeeeeeee")
									file.transferTo(_file)
								 }
					  } catch (Exception e) {
				 
					   }
					  def image_url = "imageFile/"+key
					  product_inst.setProductImageUrl(image_url)
			}
					  
			product_inst.setProductDescription(params.product_description)
			product_inst.setProductName(params.product_name)
			product_inst.setProductTitle(params.product_title)					  
			product_inst.setPromotionalPrice(params.promotional_price)		  
			product_inst.setUnitPrice(params.unit_price)	  		  		  
			product_inst.setQuantity(params.quantity)		 
					  //println("property_image_inst   after saveeeeeeeeeeeeeeeeeeeee "+params.property_id)
			  
			  
			  if(product_inst.save(flush:true)){
				  
				  redirect(controller:"product",action:"productList")
				  
			  }else{
			  
				redirect(controller:"product",action:"productList")
			  }
		  
		  
		
		
	}
	
	def productList ={
		
		
		
		
	}
	
	def productListJSON = {
		
		def db = new Sql(dataSource)
		def prod_list = []
		def list_data = []
		def main_list_data = []
		
//		def query = "SELECT id as prod_id,product_name,product_title,promotional_price,unit_price,quantity,product_image_url FROM `product`"
//		
//		try {
//			
//			db.eachRow(query) {
//			
//			prod_list<< it.toRowResult()
//			}
//			}catch (Exception e) {
//			
//			}
			
//			def results = prod_list?.collect {
//				
//							list_data.add("<a href='#'><img src='../"+it.product_image_url+"'  height='40' width='40' ></a>")
//							
//							list_data.add(it.product_name)
//							list_data.add(it.product_title)
//							list_data.add(it.unit_price)
//							list_data.add(it.promotional_price)
//							list_data.add(it.quantity)
//							list_data.add("<a href='#'><img src='../images/editicon.png' alt=''  height='20' width='20' onclick='updateData("+it.prod_id+")'></a>")
//							list_data.add("<a href='#'><img src='../images/delete_icon.png' alt=''  height='20' width='20' onclick='deleteData("+it.prod_id+")'></a>")
//							main_list_data.add(list_data)
//							list_data = []
//						}
		def prod_listnew = Product.list();
		
		
			prod_listnew?.collect {
			
				
							list_data.add("<a href='#'><img src='../"+it.productImageUrl+"'  height='40' width='40' ></a>")
							
							list_data.add(it.productName)
							list_data.add(it.productTitle)
							list_data.add(it.unitPrice)
							list_data.add(it.promotionalPrice)
							list_data.add(it.quantity)
							list_data.add("<a href='#'><img src='../images/editicon.png' alt=''  height='20' width='20' onclick='updateData("+it.id+")'></a>")
							list_data.add("<a href='#'><img src='../images/delete_icon.png' alt=''  height='20' width='20' onclick='deleteData("+it.id+")'></a>")
							main_list_data.add(list_data)
							list_data = []
							//println("Adding data for "+it+" th time");
						
							
		}
			render main_list_data as JSON
		
	}
	
	def deleteProduct = {
		
		  println("params inside deleteProduct ::::::::::::"+params)
		  
		  try{
		  
				  def product_inst = Product.get(params.product_id)
				  
				  def db = new Sql(dataSource)
				  
				  def delete_cart = "delete FROM `cart` where cart_line_item_id in(SELECT id as cart_line_id FROM `cart_line_item` where product_id ="+product_inst.id+")"
				  db.execute(delete_cart)
				  
				  def delete_cart_line_item = "delete  FROM `cart_line_item` where product_id = "+product_inst.id+" "
				  
				  db.execute(delete_cart_line_item)
				  
				  product_inst.delete()
				  
				  render "success"
		  }catch(Exception e){
		  
		     println("eroor inside  "+e)
			 render "failure"
		  }
		
	}
	def editProduct(){
		
		 // println("params ::::::::::::"+params.id)
		  
		  def product_inst = Product.get(params.id)
		  //println("product_inst    ::::::::::::"+product_inst)
		  [product_inst:product_inst]
		
	}
}
