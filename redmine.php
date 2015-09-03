#!/usr/bin/php
<?php

$dbhost='192.168.1.242';
$dbuser='root';
$dbpass='root';
$dbname='redmine';

$project=$argv[1];
$to=$argv[2];
$title=$argv[3];
$content=$argv[4];

$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die ('Error connecting to '.$dbhost.' mysql server');
mysql_select_db($dbname) or die ('Error connecting to Database: '.$dbname.'');
mysql_query("set names utf8");

$test = mysql_query("SELECT id,lft,rgt FROM projects WHERE identifier = '".$project."'") or die ('Table "projects" do not exist');
$total = mysql_fetch_assoc($test);
if ($total) {
  $p_id = $total['id'];
  $lft = $total['lft'];
  $rgt = $total['rgt'];

    $test = mysql_query("SELECT id FROM users WHERE login = '".$to."'") or die ('Table "users" do not exist');
    $total = mysql_fetch_assoc($test);
    if ($total) {
      $id = $total['id'];
    
      $sql = "INSERT INTO `issues` (`tracker_id`, `project_id`, `subject`, `description`, `due_date`, `category_id`, `status_id`, `assigned_to_id`, `priority_id`, `fixed_version_id`, `author_id`, `lock_version`, `created_on`, `updated_on`, `start_date`, `done_ratio`, `estimated_hours`, `parent_id`, `root_id`, `lft`, `rgt`, `is_private`, `closed_on`) VALUES ('1', '".$p_id."', '".$title."', '".$content."', now(), NULL, '1', '".$id."', '1', NULL, '1', '1', now(), now(), now(), '0', '1', NULL, '1', '".$lft."', '".$rgt."', '0', NULL)";
      #echo $sql;
      mysql_query($sql) or die ('Error sql: '.$sql);
    }
}

mysql_close($conn);
?>
