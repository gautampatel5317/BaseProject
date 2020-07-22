<?php

namespace App\Http\Controllers\Backend\Home;
use Illuminate\Http\Request;

class HomeController {
	public function index(Request $request) {
		return view('home');
	}
	public function video(Request $request) {
		return view('video');
	}
	public function Calander(Request $request) {
		$events   = [];
		$events[] = \Calendar::event(
			'Event One', //event title
			false, //full day event?
			'2020-05-20T0800', //start time (you can also use Carbon instead of DateTime)
			'2020-05-12T0800', //end time (you can also use Carbon instead of DateTime)
			0//optionally, you can specify an event ID
		);

		$events[] = \Calendar::event(
			"Book My Show", //event title
			true, //full day event?
			new \DateTime('2020-05-20'), //start time (you can also use Carbon instead of DateTime)
			new \DateTime('2015-05-20'), //end time (you can also use Carbon instead of DateTime)
			'stringEventId'//optionally, you can specify an event ID
		);
		$events[] = \Calendar::event(
			"Valentine's Day", //event title
			true, //full day event?
			new \DateTime('2020-05-21'), //start time (you can also use Carbon instead of DateTime)
			new \DateTime('2020-05-23'), //end time (you can also use Carbon instead of DateTime)
			'stringEventId'//optionally, you can specify an event ID
		);

		$calendar = \Calendar::addEvents($events)
			->setOptions([//set fullcalendar options
				'firstDay' => 1
			])->setCallbacks([//set fullcalendar callback options (will not be JSON encoded)
				'viewRender' => 'function() {alert("Callbacks!");}'
			]);;
		// dd($calendar);
		return view('calander', compact('calendar'));
	}
	public function barCode(Request $request) {
		$qrCode = \QrCode::format('svg')->size(200)->generate('Ticketstar QRCODE!');
		return view('barcode', compact('qrCode'));
	}
}
