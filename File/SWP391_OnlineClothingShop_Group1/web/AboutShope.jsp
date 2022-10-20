<%-- 
    Document   : AboutShope
    Created on : Nov 7, 2021, 3:32:19 PM
    Author     : LAMDTHE153097
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SHOPE</title>
        <!--CSS-->
        <link href="css/AboutShope.css" rel="stylesheet" type="text/css"/> 
        <!--ICON-->
        <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
    </head>
    <body>
        <header>
            <a href="${pageContext.request.contextPath}/home">
                <img class="logo" src="${pageContext.request.contextPath}/resources/img/SHOPE-logos_transparent.png" alt="logo"></a>
            <ul class="main-nav">
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=0&brand=0&price=0&sortType=0&sortMode=0">
                        Product</a></li>
                <li><a href="MainRecruitment.jsp">Recruitment</a></li>
            </ul>
            <div class="clearfix"></div>
            <div class="row">
                <div class="heading-main-box">
                    <h1 class="titles">Vietnamese people<br>use Vietnamese goods.<br>So join with us</h1>
                </div>
            </div>
        </header>
        <br>
        <div class="container">
            <h1>Giới thiệu</h1>
            <br>
            <div class="content">
                <p>
                    Shope Store ra đời từ 2012, khởi đầu ở một cửa hàng nhỏ trên phố Lò Đúc. 
                    Shope Store những ngày đầu được gây dựng bởi 3 chàng trai trẻ tuổi, 
                    ôm trong mình hoài bão thay đổi xu hướng thời trang Việt Nam.
                </p>
                <br>
                <p>
                    Bằng đam mê với vest và bằng những cố gắng bền bỉ trong từng giây phút, 
                    Shope Store đã tiên phong trong ngành thời trang, thay đổi tư duy khách hàng, 
                    trở thành thương hiệu Việt Nam lớn nhất trong thị phần vest may sẵn, là thương hiệu uy tín về đồ Âu cho nam giới
                </p>
                <br>
                <p>
                    <img src="resources/gioithieu.jpg" 
                         style="display: block; margin-left: auto; margin-right: auto;">
                </p>
                <br>
                <h2 style="text-align: center;">5 lý do nên mua sản phẩm ở shope store</h2>
                <br>
                <p><strong>Nhiều size nhất, sát người dùng nhất</strong></p>
                <br>
                <p>Nếu các thương hiệu khác chỉ có 3 sizes cho khách hàng thì ở Shope Store có đến 5 sizes phù hợp cho người từ 48-85kg. 
                    Chúng tôi muốn đảm bảo bạn luôn có thể chọn được một chiếc áo mặc vừa với người.</p>
                <br>
                <p>
                    <img src="resources/gioithieu2.jpg" 
                         style="display: block; margin-left: auto; margin-right: auto;">
                </p>
                <br>
                <h3 style="text-align: center;">Hệ thống hơn 60 cửa hàng toàn quốc</h3>
                <br>
                <p>Shope Store giờ đây có hệ thống hơn 60 cửa hàng trên 35 tỉnh thành Việt Nam và vẫn đang tiếp tục mở rộng phủ kín Việt Nam. 
                    Với việc hỗ trợ mua hàng online, khách hàng hoàn toàn có thể sở hữu được trang phục Adam Store một cách dễ dàng.</p>
                <br>
                <p>
                    <img src="resources/gioithieu3.jpg" 
                         style="display: block; margin-left: auto; margin-right: auto;">
                </p>
                <br>
                <h3 style="text-align: center;">Phom dáng được tối ưu cho người Việt</h3>
                <br>
                <p>Với tôn chỉ "Vì khách hàng xứng đáng những điều tốt đẹp nhất", Shope rất chú trọng đến cảm xúc và trải nghiệm của khách hàng. 
                    Chúng tôi có những không gian mua hàng xứng tầm, với đội ngũ tư vấn chuyên nghiệp, có gu thẩm mỹ tốt, 
                    được đào tạo bài bản để giúp khách hàng có sự mua sắm tốt nhất.</p>
                <br>
                <p>
                    <img src="resources/gioithieu4.jpg" 
                         style="display: block; margin-left: auto; margin-right: auto;">
                </p>
                <br>
                <h3 style="text-align: center;">Dịch vụ chăm sóc tốt nhất</h3>
                <br>
                <p>Shope Store qua 5 năm đã có hơn 40 lần điều chỉnh các phom dáng thiết kế dựa trên sự phản hồi của khách hàng và ý kiến của các chuyên gia hơn 20 năm kinh nghiệp.
                    Chúng tôi đã tạo ra được những mẫu phù hợp nhất cho khách hàng để che dấu đi những nhược điểm của người Việt.</p>
                <br>
                <p>
                    <img src="resources/gioithieu5.jpg" 
                         style="display: block; margin-left: auto; margin-right: auto;">
                </p>
                <br>
                <h3 style="font-weight: 500; text-align: center;"><strong>Hơn 500,000 khách hàng tin tưởng</strong></h3>
                <br>
                <p>Chúng tôi đã vinh dự được làm bạn đồng hành với hơn 400.000 chú rể, 
                    hơn 100.000 các doanh nhân, giám đốc, lãnh đạo cấp cao và hàng nghìn người nổi tiếng 
                    trên khắp đất nước Việt Nam, và cả nước ngoài.</p>
                <br>
                <p>
                    <img src="resources/gioithieu6.jpg" 
                         style="display: block; margin-left: auto; margin-right: auto;">
                </p>
                <br>
                <h3 style="font-weight: 500; text-align: center;"><strong>Hãy đến thăm chúng tôi</strong></h3>
                <br>
                <p class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4855345740657!2d105.52487561413173!3d21.013249986006784!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2sFPT%20University!5e0!3m2!1sen!2s!4v1636287484694!5m2!1sen!2s" 
                            width="700" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </p>
                <br>
            </div>
        </div>
        <br>
        <!-- Copyright -->
        <div class="text-center">
            © 2021 Copyright:
            <a class="text-white" href="#">SWP391 - GRP1</a>
        </div>
        <!-- Copyright -->
    </body>
</html>
