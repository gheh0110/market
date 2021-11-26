<?php 
require('top.php');
if(isset($_GET['id'])){
	$product_id=mysqli_real_escape_string($con,$_GET['id']);
	if($product_id>0){
		$get_product=get_product($con,'','',$product_id);
	}else{
		?>
		<script>
		window.location.href='index.php';
		</script>
		<?php
	}
}else{
	?>
	<script>
	window.location.href='index.php';
	</script>
	<?php
}

if(isset($_POST['review_submit'])){
    $rating = get_safe_value($con,$_POST['rating']);
    $review = get_safe_value($con,$_POST['review']);
    $added_on = date('Y-m-d h:i:s');
    $product_id= $product_id;
    $user=$_SESSION['USER_ID'];
    mysqli_query($con,"INSERT INTO product_review (product_id,user_id,rating,review,status,added_on) VALUES('$product_id','$user','$rating','$review','1','$added_on')");
}

$product_review_res = mysqli_query($con,"SELECT users.name,product_review.id,product_review.rating,product_review.review,product_review.added_on FROM users,product_review WHERE product_review.status=1 AND product_review.user_id = users.id AND product_review.product_id='$product_id' ORDER BY product_review.added_on desc");

?>

 <!-- Start Bradcaump area -->
        <div class="ht__bradcaump__area" style="background: rgba(0, 0, 0, 0) url(images/bg/v1.png) no-repeat scroll center center / cover ;">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" href="index.php">Home</a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <a class="breadcrumb-item" href="categories.php?id=<?php echo $get_product['0']['categories_id']?>"><?php echo $get_product['0']['categories']?></a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  <span class="breadcrumb-item active"><?php echo $get_product['0']['name']?></span>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Bradcaump area -->
        <!-- Start Product Details Area -->
        <section class="htc__product__details bg__white ptb--100">
            <!-- Start Product Details Top -->
            <div class="htc__product__details__top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                            <div class="htc__product__details__tab__content">
                                <!-- Start Product Big Images -->
                                <div class="product__big__images">
                                    <div class="portfolio-full-image tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active imageZoom" id="img-tab-1">
                                            <img data-origin="<?php echo PRODUCT_IMAGE_SITE_PATH.$get_product['0']['image']?>" src="<?php echo PRODUCT_IMAGE_SITE_PATH.$get_product['0']['image']?>">
                                        </div>
                                    </div>
                                </div>
                                <!-- End Product Big Images -->
                                
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 smt-40 xmt-40">
                            <div class="ht__product__dtl">
                                <h2><?php echo $get_product['0']['name']?></h2>
                                <ul  class="pro__prize">
                                    <li class="old__prize"><?php echo $get_product['0']['mrp']?></li>
                                    <li><?php echo $get_product['0']['price']?></li>
                                </ul>
                                <p class="pro__info"><?php echo $get_product['0']['short_desc']?></p>
                                <div class="ht__pro__desc">
                                    <div class="sin__desc">
										<?php
										$productSoldQtyByProductId=productSoldQtyByProductId($con,$get_product['0']['id']);
										
										$pending_qty=$get_product['0']['qty']-$productSoldQtyByProductId;
										
										$cart_show='yes';
										if($get_product['0']['qty']>$productSoldQtyByProductId){
											$stock='In Stock';			
										}else{
											$stock='Not in Stock';
											$cart_show='';
										}
										?>
                                        <p><span>Availability:</span> <?php echo $stock?></p>
                                    </div>
									<div class="sin__desc">
										<?php
										if($cart_show!=''){
										?>
                                        <p><span>Qty:</span> 
										<select id="qty">
											<?php
											for($i=1;$i<=$pending_qty;$i++){
												echo "<option>$i</option>";
											}
											?>
										</select>
										</p>
										<?php } ?>
                                    </div>
                                    <div class="sin__desc align--left">
                                        <p><span>Categories:</span></p>
                                        <ul class="pro__cat__list">
                                            <li><a href="#"><?php echo $get_product['0']['categories']?></a></li>
                                        </ul>
                                    </div>
                                    
                                    </div>
									
                                </div>
								<?php
								if($cart_show!=''){
								?>
								<a class="fr__btn" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id']?>','add')">Add to cart</a>
                                <a class="fr__btn buy_now" href="javascript:void(0)" onclick="manage_cart('<?php echo $get_product['0']['id']?>','add','yes')">Buy now</a>
                                
								<?php } ?>

                                <div id="social_share_box">
                                    <a target="_blank" href="https://facebook.com/share.php?u=<?php echo $meta_url?>"><img src="images/icons/facebook.png"></a>
                                    <a target="_blank" href="https://twitter.com/share?url=<?php echo $meta_url?>text=<?php echo $get_product['0']['name']?>"><img src="images/icons/twitter.png"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product Details Top -->
        </section>
        <!-- End Product Details Area -->
		<!-- Start Product Description -->
        <section class="htc__produc__decription bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- Start List And Grid View -->
                        <ul class="pro__details__tab" role="tablist">
                            <li role="presentation" class="description active"><a href="#description" role="tab" data-toggle="tab">description</a></li>
                            <li role="presentation" class="review"><a href="#review" role="tab" data-toggle="tab" class ="active show" aria-selected="true">review</a></li>
                        </ul>
                        <!-- End List And Grid View -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="ht__pro__details__content">
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="description" class="pro__single__content tab-pane fade in active">
                                <div class="pro__tab__content__inner">
                                    <?php echo $get_product['0']['description']?>
                                </div>
                            </div>
                            <!-- End Single Content -->
                            <div role="tabpanel" id="review" class="pro__single__content tab-pane fade active show">
                                <div class="pro__tab__content__inner">

                                <?php if(mysqli_num_rows($product_review_res)>0) { while($product_review_row=mysqli_fetch_assoc($product_review_res)){ ?>
                                    <article class="row">
                                        <div class="col-md-12 col-sm-12">
                                            <div class="panel panel-default arrow left">
                                                <div class="panel-body">
                                                    <header class="text-left">
                                                        <div><span class="comment-rating"><?php echo $product_review_row['rating']?></span> (Rated by <?php echo $product_review_row['name'] ?>) </div>
                                                        <time class="comment-date">
                                                            <?php
                                                              $added_on=strtotime($product_review_row['added_on']);
                                                              echo date('d M Y', $added_on);
                                                            ?>
                                                        </time>
                                                    </header>
                                                    <div class="comment-post">
                                                        <p><?php echo $product_review_row['review'] ?></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                <?php } } else {
                                    echo "<h3 class='submit_review_hint'>No review added</h3><br/>";
                                } ?>

                                    <h3 class="review_heading">Enter review</h3>
                                    <br/>
                                    <?php if(isset($_SESSION['USER_LOGIN'])){  ?>
                                    <div class="row" id="post-review-box">
                                        <div class="col-md-12">
                                            <form accept-charset="UTF-8" action="" method="post">
                                                <select class="form-control" name="rating" required>
                                                    <option value="">Select rating</option>
                                                    <option>Bad</option>
                                                    <option>Good</option>
                                                    <option>Very Good</option>
                                                    <option>Fantastic</option>
                                                </select>
                                                <br/>
                                                <textarea class="form-control" cols="50" id="new-review" name="review" placeholder="Enter review here..." rows="5"></textarea>
                                                <br/>
                                                <div class="text-right">
                                                    <button class="btn btn-success btn-lg" type="submit" name="review_submit">Save</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <?php } else{
                                        echo "<span class='submit_review_hint'>Please <a href='login.php' style='font-weight: bold;'> login </a> to submit review</span>";
                                    } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product Description -->
        <!--Review-->
        
										
<?php require('footer.php')?>        