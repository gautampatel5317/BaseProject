@extends('backend.layouts.admin')
@section('page-header')
{{ trans('global.video_management') }}
@endsection
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"/>
<link
    href="https://unpkg.com/@videojs/themes@1/dist/city/index.css"
    rel="stylesheet"
    />
    @section('content')
    @include('flash::message')
    <div class="container-fluid">
      <div class="card card-primary card-outline">
          <div class="card-body">
                <video class="video-js vjs-default-skin" controls width="640px" height="360px"></video>
          </div>
      </div>
  </div>
@endsection
<!-- JAvascript Included-->
@section('after-scripts')
<script src="https://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
<script src="https://vjs.zencdn.net/7.7.6/video.js"></script>
<script src="https://rawgit.com/atlance01/vrapp-ionic/master/www/js/lib/videojs-playlist.js"></script>
<script type="text/javascript">
$(document).ready(function(){
var videoList = [{
  sources: [{
    src: 'http://media.w3.org/2010/05/sintel/trailer.mp4',
    type: 'video/mp4'
  }],
  poster: 'https://www.rt.com/static/img/og-logo-rt.png'
}, {
  sources: [{
    src: 'http://media.w3.org/2010/05/bunny/trailer.mp4',
    type: 'video/mp4'
  }],
  poster: 'http://media.w3.org/2010/05/bunny/poster.png'
}, {
  sources: [{
    src: 'https://vjs.zencdn.net/v/oceans.mp4',
    type: 'video/mp4'
  }],
  poster: 'https://vjs.zencdn.net/v/oceans.png'
}, {
  sources: [{
    src: 'http://media.w3.org/2010/05/bunny/movie.mp4',
    type: 'video/mp4'
  }],
  poster: 'http://media.w3.org/2010/05/bunny/poster.png'
}, {
  sources: [{
    src: 'http://media.w3.org/2010/05/video/movie_300.mp4',
    type: 'video/mp4'
  }],
  poster: 'http://media.w3.org/2010/05/video/poster.png'
}];
var player = videojs(document.querySelector('video'), {
  inactivityTimeout: 0
});
try {
  // try on ios
  player.volume(1);
} catch (e) {}
player.playlist(videoList);
document.querySelector('.previous').addEventListener('click', function() {
  player.playlist.previous();
});
document.querySelector('.next').addEventListener('click', function() {
  player.playlist.next();
});
document.querySelector('.jump').addEventListener('click', function() {
  player.playlist.currentItem(2); // play third
});
player.playlist.autoadvance(0); // play all
Array.prototype.forEach.call(document.querySelectorAll('[name=autoadvance]'), function(el) {
  el.addEventListener('click', function() {
    var value = document.querySelector('[name=autoadvance]:checked').value;
    player.playlist.autoadvance(JSON.parse(value));
  });
});
/* ADD PREVIOUS */
var Button = videojs.getComponent('Button');
// Extend default
var PrevButton = videojs.extend(Button, {
  constructor: function() {
    Button.apply(this, arguments);
    this.addClass('icon-angle-left');
    this.controlText("Previous");
  },
  handleClick: function() {
    console.log('click');
    player.playlist.previous();
  }
});

/* ADD BUTTON */
// Extend default
var NextButton = videojs.extend(Button, {
  constructor: function() {
    Button.apply(this, arguments);
    this.addClass('icon-angle-right');
    this.controlText("Next");
  },
  handleClick: function() {
    console.log('click');
    player.playlist.next();
  }
});
// Register the new component
videojs.registerComponent('NextButton', NextButton);
videojs.registerComponent('PrevButton', PrevButton);
player.getChild('controlBar').addChild('PrevButton', {}, 0);
player.getChild('controlBar').addChild('NextButton', {}, 2);
});
</script>
@endsection