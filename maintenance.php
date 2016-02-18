<?php
header('HTTP/1.1 503 Service Temporarily Unavailable');
header('Status: 503 Service Temporarily Unavailable');
header('Retry-After: 3600');
?>
<!DOCTYPE HTML>
<html>
  <head>
    <title>OOPS! - Down For Maintenance</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css'></head>
  <style>

    html{
      height: 99%;
    }

    body {
      margin: 0;
      padding: 0;
      background: #f0f0f0 none repeat scroll 0 0;
      font-family: 'Roboto Condensed', sans-serif;
      font-size: 12px;
      min-height: 100%;
      position: relative;

    }

    h2 {
      margin-top: 10px;
      margin-bottom: 30px;
      font: 800 4em/1 'Roboto Condensed', sans-serif;
    }

    p {
      margin-top: 10px;
      margin-bottom: 20px;
      font: 1.8em/1 'Roboto Condensed', sans-serif;
      line-height: 1.5em;
    }

    .wrap {
      text-align: center;
      position: absolute;
      top: 18%;
      width: 100%;
    }

    .sub {
      margin-top: 40px;
    }

    .animate-text {
      font: 800 16.5em/1 'Roboto Condensed', sans-serif;
      fill: none;
      stroke-width: 6;
      stroke-linejoin: round;
      stroke-dasharray: 70 330;
      stroke-dashoffset: 0;
      -webkit-animation: stroke 6s infinite linear;
      animation: stroke 6s infinite linear;
    }
    .animate-text:nth-child(5n + 1) {
      stroke: #F2385A;
      -webkit-animation-delay: -1.2s;
      animation-delay: -1.2s;
    }
    .animate-text:nth-child(5n + 2) {
      stroke: #F5A503;
      -webkit-animation-delay: -2.4s;
      animation-delay: -2.4s;
    }
    .animate-text:nth-child(5n + 3) {
      stroke: #60C92A;
      -webkit-animation-delay: -3.6s;
      animation-delay: -3.6s;
    }
    .animate-text:nth-child(5n + 4) {
      stroke: #0071B9;
      -webkit-animation-delay: -4.8s;
      animation-delay: -4.8s;
    }
    .animate-text:nth-child(5n + 5) {
      stroke: #3AA1BF;
      -webkit-animation-delay: -6s;
      animation-delay: -6s;
    }

    @-webkit-keyframes stroke {
      100% {
        stroke-dashoffset: -400; }
    }

    @keyframes stroke {
      100% {
        stroke-dashoffset: -400; }
    }

    svg {
      margin: 0 auto;
      display: block;
      text-transform: uppercase;
    }

    .btn {
      display: inline-block;
      background: #272727 none repeat scroll 0 0;
      color: #fff;
      font-size: 13px;
      font-weight: bold;
      padding: 10px 20px;
      text-decoration: none;
    }
  </style>

  <body>
    <div class="wrap">

      <h2>OOPS! - Down For Maintenance</h2>

      <svg width="360" height="170">
        <!-- Symbol -->
        <symbol id="s-text">
          <text text-anchor="middle" x="50%" y="95%" dy=".0em">
          503
          </text>
        </symbol>
        <!-- Duplicate symbols -->
        <use xlink:href="#s-text" class="animate-text"></use>
        <use xlink:href="#s-text" class="animate-text"></use>
        <use xlink:href="#s-text" class="animate-text"></use>
        <use xlink:href="#s-text" class="animate-text"></use>
        <use xlink:href="#s-text" class="animate-text"></use>
      </svg>

      <div class="sub">
        <p>
          <a class="btn" href="javascript:history.back();">Back </a>
        </p>
      </div>
    </div>
  </body>
</html>
