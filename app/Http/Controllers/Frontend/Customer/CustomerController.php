<?php

namespace App\Http\Controllers\Frontend\Customer;

use App\Http\Controllers\Controller;
use App\Http\Requests\Frontend\StoreCustomer;
use App\Models\Customer\Customer;
use App\Models\Experience\Experience;
use App\Repositories\Frontend\Customer\CustomerRepository;
use Illuminate\Http\Request;

class CustomerController extends Controller {
	protected $customer;
	public function __construct(CustomerRepository $customer) {
		$this->customer = $customer;
	}

	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index() {
		return view('frontend.customer.index');
	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {
        $experienceData = Experience::where('status', '1')->get();
        if(!empty($experienceData)){
            foreach($experienceData as $data){
                $experience[$data['id']] = $data['name'];
            }
        }
        return view('frontend.customer.create',compact('experience'));
	}

	/**
	 * Store a newly created resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(StoreCustomer $request) {
		$input    = $request->except('_token');
		$customer = $this->customer->create($input);
		flash('The customer has been registered successfully!Please check mail for confirm users!')->success()->important();
		return redirect()->route('customer.index');
	}
	public function confirmCustomer(Customer $customer, Request $request) {
		$update = Customer::where('id', $customer->id)->update(['confirmed' => '1']);
		flash('The customer has been confirmed successfully!')->success()->important();
		return redirect()->route('customer.index');
	}

	/**
	 * Display the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id) {
		//
	}

	/**
	 * Show the form for editing the specified resource.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id) {
		//
	}

	/**
	 * Update the specified resource in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id) {
		//
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id) {
		//
	}
}
