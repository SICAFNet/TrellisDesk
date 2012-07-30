<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>{$title}</title>
    <link href="{$css_url}/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
    <!-- <link href="{$css_url}/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" media="all" /> -->
    
    <script src="{$js_url}/global.js" type="text/javascript"></script>
    <script src="{$js_url}/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>

<!-- Navigation -->
<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
           <a href="{$td_url}/index.php" title="{$lang['trellis_desk']}" class="brand">{$lang['trellis_desk']}</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="{$td_url}/index.php">{$lang['home']}</a></li>
              <li>{if $cache['settings']['news']['enable'] && $cache['settings']['news']['page']}<a href="{$td_url}/index.php?page=news">{$lang['news']}</a>{/if}</li>
              <li><a href="{$td_url}/index.php?page=tickets">{$lang['ticket_history']}</a></li>
              <li><a href="{$td_url}/index.php?page=tickets&amp;act=add">{$lang['open_ticket']}</a></li>
              {if $cache['settings']['kb']['enable'] && $user['g_kb_access']}<li><a href="{$td_url}/index.php?page=kb">{$lang['knowledge_base']}</a></li>{/if}
            </ul>
            
             <div class="btn-group pull-right">
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="{$td_url}/index.php?page=account">
              <i class="icon-user"></i> My Account
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li><a href="#">Profile</a></li>
              <li class="divider"></li>
              <li><a href="#">Sign Out</a></li>
            </ul>
          </div>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
    
    <br /><br /><br />


<!-- ######################   Breadcrumbs  #################### -->
<div class="container">
<div class="row">
<div class="span12">
<ul class="breadcrumb">
  <li>
    <a href="{$td_url}/index.php">{$td_name}</a>  {$nav_links}
  </li>
</ul>
</div>
</div>
</div><!-- end container -->




<div class="container">
<div class="row">
<div class="span8">

<div class="well">
  {if $wrapper_type == 1}
       
            {include file="$sub_tpl"}
       
        {elseif $wrapper_type == 2}
   
                {$redirect_msg}<br /><br />
                <span class="small">{$lang['transfer_you']}&nbsp;<a href="{$redirect_url}">{$lang['click_here']}</a>.</span>
       
        {elseif $wrapper_type == 3 || $wrapper_type == 4}
       
                {$error_msg}<br /><br />
                <span class="small">{$lang['error_small_print']}</span>
   
            {if $wrapper_type == 4}
            <form action="{$self}" method="post">
            <input type="hidden" name="do_login" value="1" />
            <div class="groupbox">{$lang['log_in']}</div>
            <input type="text" name="username" id="username" value="{$lang['username']}" size="30" />
            <input type="password" name="password" id="password" value="{$lang['password']}" size="30" />
            <label for="rememberb"><input type="checkbox" name="remember" id="rememberb" value="1" checked="checked" class="ckbox" /> {$lang['remember_me']}</label>
           <input class="btn" type="submit" name="submit" id="loginb" value="{$lang['log_in_button']}" />
            </form>
            {/if}
        
        {/if}
 

</div>


</div><!-- end span -->





<div class="span4">


<div class="well">


 {if $wrapper_type != 2}

    {if $user['id']}
        <h2>{$lang['my_account']}</h2>
     
            {$lang['welcome']} <b><a href="{$td_url}/index.php?page=myaccount">{$user['name']}</a></b>.<br /><br />
            <a href="{$td_url}/index.php?page=account">{$lang['my_account']}</a> | <a href="{$td_url}/index.php?act=logout">{$lang['logout']}</a>
     
    {elseif $user['s_tkey']}
        <h2>{$lang['my_account']}</h2>

            {$lang['welcome']} <b>{$user['s_uname']} ({$lang['guest']})</b>.<br /><br />
            <b>{$lang['your_tickets']}</b><br />
            {if $tickets}
            {foreach $tickets as $yt}
            <a href="{$td_url}/index.php?page=tickets&amp;act=view&amp;id={$yt['id']}">{$yt['subject']}</a><br />
            {/foreach}
            {else}
            {$lang['no_tickets_short']}<br />
            {/if}<br />
            {if $cache['settings']['user']['guest_upgrade']}<a href="{$td_url}/index.php?page=register&amp;act=upgrade">{$lang['upgrade_account']}</a> | {/if}<a href="{$td_url}/index.php?page=logout">{$lang['logout']}</a>
      
    {else}
        <h2>{$lang['log_in']}</h2>
     
            {if $wrapper_type != 4}
            <form action="{$self}" method="post">
            <input type="hidden" name="do_login" value="1" />
            <input type="text" name="username" id="username" value="{$lang['username']}" /><br />
            <input type="password" name="password" id="password" value="{$lang['password']}" style="margin-top:5px"/><br />
            <label for="remember"><input type="checkbox" name="remember" id="remember" value="1" checked="checked" class="ckbox" /> <span class="bluetxt">{$lang['remember_me']}</span></label>
            <input class="btn" type="submit" class="submit" name="submit" id="login" value="{$lang['log_in_button']}" style="margin-top:5px"/><br /><br />
            </form>
            {/if}
            <a href="{$td_url}/index.php?page=register">{$lang['register']}</a> | <a href="{$td_url}/index.php?page=register&amp;act=resendval">{$lang['resend_val']}</a><br />
            <a href="{$td_url}/index.php?page=register&amp;act=forgotpass">{$lang['forgot_pass']}</a>
   
    {/if}
    {if $cache['settings']['kb']['enable'] && $user['g_kb_access']}
    {if $input['page'] != 'kb' || $input['act']}
    <br />
    <form action="{$td_url}/index.php?page=kb&amp;act=search" method="post">
    <h2>{$lang['search']}</h2>
  
    <input type="text" name="search" id="search" value="{$lang['enter_keywords']}" /><br /><br />
    <input class="btn" type="submit" name="submit" id="dosearch" value="{$lang['search_button']}" />
 
    </form>
    {else}
    {if $articles_recent}
    <br />
    <h2>{$lang['articles_recent']}</h2>

    {foreach $articles_recent as $a}
    <a href="{$td_url}/index.php?page=kb&amp;act=view&amp;id={$a['id']}" title="{$a['description']}">{$a['title']}</a><br />
    {/foreach}
   
    {/if}
    {if $articles_most_viewed}
    <br />
    <h2>{$lang['articles_most_viewed']}</h2>

    {foreach $articles_most_viewed as $a}
    <a href="{$td_url}/index.php?page=kb&amp;act=view&amp;id={$a['id']}" title="{$a['description']}">{$a['title']}</a><br />
    {/foreach}

    {/if}
    {if $articles_top_rated}
    <br />
    <h2>{$lang['articles_top_rated']}</h2>

    {foreach $articles_top_rated as $a}
    <a href="{$td_url}/index.php?page=kb&amp;act=view&amp;id={$a['id']}" title="{$a['description']}">{$a['title']}</a><br />
    {/foreach}

    {/if}
    {/if}
    {/if}

    {/if}




</div><!-- end well -->



</div><!-- end container -->



      
<div class="container">
<div class="row">
<div class="span12">
<hr>
 {$copyright}
</div>
</div>
</div>    
  

</body>
</html>