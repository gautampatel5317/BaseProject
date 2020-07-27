@extends('frontend.layouts.app')
@section('header')
@endsection
@section('content')
<div id="content" class="p-3 p-md-3 pt-3">
	<div class="container-fluid">
		<div class="card card-primary card-outline">
			<div class="card-header">
				<div class="card-tools">
					<span style="color: blue;font-style: normal;">Products List</span> @include('frontend.products.partials.products-header-button')
				</div>
			</div>
			<div class="card-body">
				<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6"></div>
						<div class="col-sm-12 col-md-6"></div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="box-body">
								<div class="table-responsive-lg data-table-wrapper">
									<table id="billing_plans" class="table table-condensed table-hover table-bordered">
										<thead>
											<tr>
												<th scope="col" class="text-center">
													Category
												</th>
												<th scope="col" class="text-center">
													Name
												</th>
												<th>
													Image
												</th>
												<th scope="col" class="text-center">
													Description
												</th>
												<th scope="col" class="text-center">
													Rate
												</th>
												<th scope="col" class="text-center">
													Sale Rate
												</th>
												<th scope="col" class="text-center">
													Status
												</th>
												<th scope="col" class="text-center">
													Actions
												</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Computer</td>
												<td>Keyboard</td>
												<td>
													<img style="height: 40px;" src="https://rukminim1.flixcart.com/image/416/416/k226oi80/keyboard/laptop-keyboard/5/j/z/logitech-mk275-mouse-original-imafk89qfzrgnwzv.jpeg?q=70">
												</td>
												<td>With comfortable, quiet typing, a sleek yet sturdy design and a plug-and-play USB connection.</td>
												<td>₹1500</td>
												<td>₹1225.50</td>
												<td><span class='badge badge-success'>Active</span></td>
												<td>
													<div class="btn-group action-btn">
														<a href="" class="text-primary p2-2">
															<i data-toggle="tooltip" data-placement="top" title="View" class="fa fa-edit"></i>
														</a>&nbsp;
														<a href="" class="text-primary p2-2">
															<i data-toggle="tooltip" data-placement="top" title="View" class="fa fa-eye"></i>
														</a>&nbsp;
														<a href="" class="text-danger p2-2">
															<i data-toggle="tooltip" data-placement="top" title="View" class="fa fa-trash"></i>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>Computer</td>
												<td>Mouse</td>
												<td>
													<img style="height: 40px;" src="https://rukminim1.flixcart.com/image/416/416/mouse/m/b/s/amkette-kwik-pro-kp-10-usb-original-imaekwwrqkgxcdf2.jpeg?q=70">
												</td>
												<td>The Amkette Kwik Pro Optical Mouse is a premium and ergonomic mouse designed to perform at the highest level</td>
												<td>₹270</td>
												<td>₹225</td>
												<td><span class='badge badge-danger'>Inactive</span></td>
												<td>
													<div class="btn-group action-btn">
														<a href="" class="text-primary p2-2">
															<i data-toggle="tooltip" data-placement="top" title="View" class="fa fa-edit"></i>
														</a>&nbsp;
														<a href="" class="text-primary p2-2">
															<i data-toggle="tooltip" data-placement="top" title="View" class="fa fa-eye"></i>
														</a>&nbsp;
														<a href="" class="text-danger p2-2">
															<i data-toggle="tooltip" data-placement="top" title="View" class="fa fa-trash"></i>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
@section('after-script')
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
@endsection