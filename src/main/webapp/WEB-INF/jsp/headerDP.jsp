<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="madhu">

    <title>Start today - A todo application</title>

	<link href="/css/prism.css" rel="stylesheet"> 
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="/webjars/bootstrap/3.3.6/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link href="/css/blog-post.css" rel="stylesheet">
    <script src="/js/ckeditor/ckeditor.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript">

    var keyword = "mountains";
    
    var searchWord = '${note.content}';
    if(searchWord != null){
    	keyword = searchWord;
    	//alert('${note.tags}');
    }

    $(document).ready(function(){

        $.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?",
        {
            tags: keyword,
            tagmode: "any",
            format: "json"
        },
        function(data) {
            var rnd = Math.floor(Math.random() * data.items.length);

            var image_src = data.items[rnd]['media']['m'].replace("_m", "_b");
            $(".img-responsive").attr("src", image_src);

            //$('body').css('background-image', "url('" + image_src + "')");

        });

    });
    </script>

</head>

<body>
<jsp:include page="navigation.jsp"/>
