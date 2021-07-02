<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head>
	<!-- <meta http-equiv="Content-Type" content="text/html; charset=iso-2022-jp"> -->

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>
		body {
			background-color: #ffffff;
			color: #333;
			 -webkit-text-size-adjust: 100%;
		}
		table {
            width: 600px;
			margin: 1em 0;
			border-collapse: collapse;
		}
		th,
		td {
			padding: 1em .5em;
			border: 1px solid #333;
			font-size: 1em;
		}
		th {
            width: 20%;
			background-color: #d3d3d3;
			font-weight: normal;
			text-align: left;
/*            white-space: nowrap;*/
		}
		td {
			width: calc(65%);
			background-color: #fff;
			word-break: break-all;
		}
        @media screen and (max-width:600px) {
            table {
                width: 100%;
            }
            th {
                width: 35%;
                /* width: 7em; */
            }
			th,
			td {
				font-size: 4.5vw;
			}
        }
	</style>
</head>

<body>
	@yield('content')
</body>
</html>