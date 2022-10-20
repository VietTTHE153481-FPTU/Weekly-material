<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/stylep.css">
    <script src="https://kit.fontawesome.com/1147679ae7.js"></script>
    <title>Ivy-Project</title>
</head>
<body>
    <!--Stating HEADER -->
    <header>
        <div class="logo">
             <img src="">
        </div>
        <div class="menu">
            <li><a href="">NỮ</a>
                <ul class="sub-menu">
                    <li><a href="">Hàng Mới Về</a></li>
                    <li><a href="">Collection</a></li>
                    <li><a href="">Áo</a>
                        <ul>
                            <li><a href="">Áo Sơ Mi</a></li>
                            <li><a href="">Áo Thun</a></li>
                            <li><a href="">Áo Khoác</a></li>
                            <li><a href="">Áo Vest</a></li>                                                 
                        </ul>
                    </li>
                    <li><a href="">Quần</a>
                        <ul>
                            <li><a href="">Quần Jean</a></li>
                            <li><a href="">Quần lửng</a></li>
                            <li><a href="">Quần dài</a></li>       
                            <li><a href="">Quần Kaki</a></li>                                                            
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a href="">NAM</a></li>
                <ul class="sub-menu">
                    <li><a href="">Hàng Mới Về</a></li>
                    <li><a href="">Collection</a></li>
                    <li><a href="">Áo</a>
                        <ul>
                            <li><a href="">Áo Sơ Mi</a></li>
                            <li><a href="">Áo Thun</a></li>
                            <li><a href="">Áo Khoác</a></li>
                            <li><a href="">Áo Vest</a></li>                                                 
                        </ul>
                    </li>
                    <li><a href="">Quần</a>
                        <ul>
                            <li><a href="">Quần Jean</a></li>
                            <li><a href="">Quần lửng</a></li>
                            <li><a href="">Quần dài</a></li>       
                            <li><a href="">Quần Kaki</a></li>                                                            
                        </ul>
                    </li>
            </ul>
            <li><a href="">TRẺ EM</a></li>
            <li><a href="">SALE</a></li>
            <li><a href="">KHẨU TRANG</a></li>
            <li><a href="">BST</a></li>
            <li><a href="">THÔNG TIN</a></li>          
        </div>
        <div class="others">           
            <li><input placeholder="Tìm kiếm" type="text"> <i class="fas fa-search"></i></li>
            <li> <a class="fa fa-paw" href=""></a></li>
            <li> <a class="fa fa-user" href=""></a></li>
            <li> <a class="fa fa-shopping-bag" href=""></a></li>
                      
        </div>
    </header> 
    <!--Ending HEADER -->
<!-------------------------------------------  product ---------------------------------->
    <section class="product">
        <div class="container">
            <div class="product-top row">
                <p>Trang chủ</p> <span>&#10230; </span> <p>Nam</p> <span>&#10230;</span> <p>abc</p> <span>&#10230</span> <p>${productdetailjsp.product.productName}</p>
            </div>
            <div class="product-content row">
                <div class="product-content-left row">
                    <div class="product-content-left-big-img">
                        <img src="${productdetailjsp.productImg.fullImg}" alt="abc">
                       
                    </div>
                    <div class="product-content-left-small-img">
                        <img src="${productdetailjsp.productImg.fullImg}" alt="">
                        <img src="${productdetailjsp.productImg.topImg}" alt="">
                        <img src="${productdetailjsp.productImg.otherImg}" alt="">
                        <img src="${productdetailjsp.productImg.bottomImg}" alt="">
                        
                    </div>

                </div>
                <div class="product-content-right">
                    <div class="product-content-right-product-name">
                        <h1>${productdetailjsp.product.productName}</h1>
                        <p>MSP: ABC</p>
                    </div>
                    <div class="product-content-right-product-price">                      
                        <p>${productdetailjsp.product.originPrice}<sup>đ</sup></p>
                    </div>
                    <div class="product-content-right-product-color">
                        <p><span>Màu sắc</span>: Xanh nước biển <span style="color: red;">*</span></p>
                        <div class="product-content-right-product-color-img">
                            <img src="resources/img/products/spcolor.png" alt="">
                        </div>
                    </div>
                    <div class="product-content-right-product-size">
                        <p style="font-weight: bold;">Size:</p>
                        <div class="size">
                            <span>S</span>
                            <span>M</span>
                            <span>L</span>
                            <span>XL</span>
                            <span>XXL</span>
                        </div>
                    </div>
                    <div class="quantity">
                        <p style="font-weight: bold;">Số lượng:</p>
                        <input type="number" min="0" value="${productdetailjsp.product.amount}">
                        <p style="color: red;">Vui lòng chọn size*</p>
                    </div>
                    <div class="product-content-right-product-button">
                        <button><i class="fas fa-shopping-cart"></i><p>MUA HÀNG</p></buttom>
                        <button><p>TÌM TẠI CỬA HÀNG</p></button>
                    </div>
                    <div class="product-content-right-product-icon">
                        <div class="product-content-right-product-icon-item">
                              <i class="fas fa-phone-alt"></i> <p>Hotline</p>
                        </div>                   
                        <div class="product-content-right-product-icon-item">
                            <i class="fas fa-comments"></i> <p>Chat</p>
                        </div>     
                        <div class="product-content-right-product-icon-item">
                            <i class="fas fa-envelope"></i> <p>Mail</p>
                        </div>    
                    </div>
                    <div class="product-content-right-product-QR">
                        <img src="resources/img/products/qrcode2.png" alt="">
                    </div>
                    <div class="product-content-right-bottom">
                        <div class="product-content-right-bottom-top">
                             &#8744;
                        </div>
                        <div class="product-content-right-bottom-content-big">
                            <div class="product-content-right-bottom-content-title row">
                                <div class="product-content-right-bottom-content-title-item chitiet">
                                    <p>Chi tiết</p>
                                </div>
                                <div class="product-content-right-bottom-content-title-item baoquan">
                                    <p>Bảo quản</p>
                                </div>                              
                                <div class="product-content-right-bottom-content-title-item">
                                    <p>Tham khảo size</p>
                                </div>
                            </div>
                            <div class="product-content-right-bottom-content">
                                <div class="product-content-right-bottom-content-chitiet">
                                    <big>THÔNG TIN CHI TIẾT:</big> <br><br>
                                    <p> ${productdetailjsp.product.desc}</p>
                                </div>             
                                <div class="product-content-right-bottom-content-baoquan">
                                    Chi tiết bảo quản sản phẩm : <br><br>

* Vải dệt kim : sau khi giặt sản phẩm phải được phơi ngang tránh bai dãn. <br><br>

* Vải voan , lụa , chiffon nên giặt bằng tay. <br><br>

* Vải thô , tuytsy , kaki không có phối hay trang trí đá cườm thì có thể giặt máy. <br><br>

* Vải thô , tuytsy, kaki có phối màu tường phản hay trang trí voan , lụa , đá cườm thì cần giặt tay. <br><br>

* Đồ Jeans nên hạn chế giặt bằng máy giặt vì sẽ làm phai màu jeans.Nếu giặt thì nên lộn trái sản phẩm khi giặt , đóng khuy , kéo khóa, không nên giặt chung cùng đồ sáng màu , tránh dính màu vào các sản phẩm khác.  <br><br>

* Các sản phẩm cần được giặt ngay không ngâm tránh bị loang màu , phân biệt màu và loại vải để tránh trường hợp vải phai. Không nên giặt sản phẩm với xà phòng có chất tẩy mạnh , nên giặt cùng xà phòng pha loãng. <br><br>

* Các sản phẩm có thể giặt bằng máy thì chỉ nên để chế độ giặt nhẹ , vắt mức trung bình và nên phân các loại sản phẩm cùng màu và cùng loại vải khi giặt.  <br><br>

* Nên phơi sản phẩm tại chỗ thoáng mát , tránh ánh nắng trực tiếp sẽ dễ bị phai bạc màu , nên làm khô quần áo bằng cách phơi ở những điểm gió sẽ giữ màu vải tốt hơn.   <br><br>

* Những chất vải 100% cotton , không nên phơi sản phẩm bằng mắc áo mà nên vắt ngang sản phẩm lên dây phơi để tránh tình trạng rạn vải.   <br><br>

* Khi ủi sản phẩm bằng bàn là và sử dụng chế độ hơi nước sẽ làm cho sản phẩm dễ ủi phẳng , mát và không bị cháy , giữ màu sản phẩm được đẹp và bền lâu hơn. Nhiệt độ của bàn là tùy theo từng loại vải. 
                                </div>                   
                            </div>
                        </div>
                    </div>
                </div>
            </div>       
        </div>
    </section>
<!-------------------------------------------  "product-related" ------------------------->
<section class="product-related container">
    <div class="product-related-title">
        <p>SẢN PHẨM LIÊN QUAN</p>
    </div>
    <div class="row product-content">
        <div class=" product-related-item">
            <img src="resources/img/products/pr2.jpg" alt="">
            <h1>ÁO PHÔNG NAM TAY NGẮN 4APKB003HOD</h1>
            <p>190.000<sup>đ</sup></p>
        </div>
        <div class="product-related-item">
            <img src="resources/img/products/pr3.jpg" alt="">
            <h1>ÁO PHÔNG NAM TAY NGẮN 5APKB004CAD</h1>
            <p>190.000<sup>đ</sup></p>
        </div>
        <div class="product-related-item">
            <img src="resources/img/products/pr4.jpg" alt="">
            <h1>ÁO PHÔNG NAM TAY NGẮN 5APKB003DEN</h1>
            <p>190.000<sup>đ</sup></p>
        </div>
        <div class="product-related-item">
            <img src="resources/img/products/pr5.jpg" alt="">
            <h1>ÁO PHÔNG NAM TAY NGẮN 5APKB004XDU</h1>
            <p>190.000<sup>đ</sup></p>
        </div> 
        <div class="product-related-item">
            <img src="resources/img/products/pr6.jpg" alt="">
            <h1>ÁO PHÔNG NAM TAY NGẮN 4APKB002DEN</h1>
            <p>190.000<sup>đ</sup></p>
        </div> 
    </div>
</section>
<!-------------------------------------------  footer ---------------------------------->
    <section class="app-container">
        <p>Tải ứng dụng </p>
        <div class="app-google">
            <img src="resources/img/products/appstore.png">
            <img src="resources/img/products/googleplay.png">          
        </div>
        <p>Nhận bản tin Shop</p>
        <input type="text" placeholder="Nhập email của bạn....">
    </section>
    <div class="footer-top">
        <li><a href=""><img src="resources/img/products/datthongbao.png" alt=""></a></li>
        <li><a href=""></a>Liên hệ</li>
        <li><a href=""></a>Tuyển dụng</li>
        <li><a href=""></a>Giới thiệu</li>
        <li>
            <a href="" class="fab fa-facebook-f"></a>
            <a href="" class="fab fa-twitter"></a>
            <a href="" class="fab fa-youtube"></a>
        </li>
    </div>
    <div class="footer-bottom">
        @Remouse All rights reserved
    </div>
    <script src="js/script.js"></script>
</body>
</html>
