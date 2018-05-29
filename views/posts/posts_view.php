<style>
.comments {
  margin: 2.5rem auto 0;
  max-width: 60.75rem;
  padding: 0 1.25rem;
}

.comment-wrap {
  margin-bottom: 1.25rem;
  display: table;
  width: 100%;
  min-height: 5.3125rem;
}

.photo {
  padding-top: 0.625rem;
  display: table-cell;
  width: 3.5rem;
}
.photo .avatar {
  height: 2.25rem;
  width: 2.25rem;
  border-radius: 50%;
  background-size: contain;
}

.comment-block {
  padding: 1rem;
  background-color: #fff;
  display: table-cell;
  vertical-align: top;
  border-radius: 0.1875rem;
  box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.08);
}
.comment-block textarea {
  width: 100%;
  resize: none;
}

.comment-text {
  margin-bottom: 1.25rem;
}

.bottom-comment {
  color: #acb4c2;
  font-size: 0.875rem;
}

.comment-date {
  float: left;
}

.comment-actions {
  float: right;
}
.comment-actions li {
  display: inline;
  margin: -2px;
  cursor: pointer;
}
.comment-actions li.complain {
  padding-right: 0.75rem;
  border-right: 1px solid #e1e5eb;
}
.comment-actions li.reply {
  padding-left: 0.75rem;
  padding-right: 0.125rem;
}
.comment-actions li:hover {
  color: #0095ff;
}
</style>
<div class="container">
	 <div id="blog" class="row">
                 <div class="col-md-10 blogShort">
                     <h1><?=$post['post_subject'];?></h1>

                     <article><p>
                         <?=$post['post_text'];?>
                         </p></article>
                     <p class="lead"><i class="fa fa-user"></i> Posted by <?=$post['name'] ;?> <i class="fa fa-calendar"></i> on <?=$post['post_created'];?> </p>
											 <p><i class="fa fa-tags"></i> Tags: <?foreach ($tags as $tag):?><a href="<?=BASE_URL?>tags/view/<?=$tag['tag_id']?>"><span class="badge badge-info"><?=$tag['tag_name']?></span></a> <?endforeach?></p>
                 </div>
<div class="comments">
	<?foreach($comms as $comm):?>

 		<div class="comment-wrap">
 				<div class="photo">
 						<div class="avatar" style="background-image: url('https://s3.amazonaws.com/uifaces/faces/twitter/jsa/128.jpg')"></div>
 				</div>
 				<div class="comment-block">
 						<p class="comment-text"><?=$comm['comment_text'];?></p>
 						<div class="bottom-comment">
 								<div class="comment-date"><?=$comm['comment_created'];?></div>
 						</div>
 				</div>
 		</div>

<?endforeach?>
<div class="comment-wrap">
				<div class="photo">
						<div class="avatar" style="background-image: url('https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg')"></div>
				</div>
				<div class="comment-block">
						<form name="FORM" method="post" action="<?=BASE_URL?>posts/ins/<?=$post['post_id']?>">
								<input style="width:100%; height:110px;" name="comment"  placeholder="Add comment..."></input>
						</form>
				</div>
		</div>
<?php $comment = $_POST['comment']?>
</div>
</div>
</div>
