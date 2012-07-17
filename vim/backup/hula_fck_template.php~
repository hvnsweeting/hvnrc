<?php
include_once("../ext/fckeditor/fckeditor.php");
echo "<html>";
echo "<head>";
echo "<title>FCKeditor - HULA</title>";
echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">';
echo "</head>";
//push text to db
if(isset($_POST['FCKeditor1']))
{
	$sValue = stripslashes( $_POST['FCKeditor1'] ) ;
	$sql_update = "UPDATE ".TABLE_HULA_OUR_INFOS." SET content='".$sValue."' WHERE type='".$info_type."'";
	tep_db_query($sql_update);
}

echo "<body>";
echo '<form action="" method="post">';

//Get text from db
$result = tep_db_query($sql);
$textarea = '';
while(($row = tep_db_fetch_array($result)) != null)
	$textarea.= $row['content'];

//Create fckeditor
$oFCKeditor = new FCKeditor('FCKeditor1') ;
$oFCKeditor->BasePath = '../ext/fckeditor/' ;
$oFCKeditor->Value = $textarea ;
$oFCKeditor->Create() ;
echo "<br>";
echo '<input type="submit" value="Submit">';
echo "</form>";
echo "</body>";
echo "</html>";
?>
