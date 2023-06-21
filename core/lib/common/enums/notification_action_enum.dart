enum NotficationActionEnum {
  Add,
  Update,
  Delete,
  Move,
  Approved,
  AddMember,
  Send,
  InviteLike,
  InviteMakeFriend,
  Like,
  Dislike,
  Comment,
  Pin,
  Tag,
  Invite,
  Accept,
  Refuse,
  SubmitHomework,
  GiveHomework,
  Remind,
  Marking,
  ConvertVideo,
  RefuseInvite,
  AcceptInvite,
  RemoveUser,
  Start,
  Escape,
}

extension ParseToString on NotficationActionEnum {
  String get getValue => toString().split('.').last;
}

Map<String, String> getTitleByAction = <String, String>{
  NotficationActionEnum.Add.getValue: 'notification_action_add',
  NotficationActionEnum.Update.getValue: 'notification_action_update',
  NotficationActionEnum.Delete.getValue: 'notification_action_delete',
  NotficationActionEnum.Move.getValue: 'notification_action_move',
  NotficationActionEnum.Approved.getValue: 'notification_action_approved',
  NotficationActionEnum.AddMember.getValue: 'notification_action_add_member',
  NotficationActionEnum.Send.getValue: 'notification_action_send',
  NotficationActionEnum.InviteLike.getValue: 'notification_action_invite_like',
  NotficationActionEnum.InviteMakeFriend.getValue: 'notification_action_invite_make_friend',
  NotficationActionEnum.Like.getValue: 'notification_action_like',
  NotficationActionEnum.Dislike.getValue: 'notification_action_dislike',
  NotficationActionEnum.Comment.getValue: 'notification_action_comment',
  NotficationActionEnum.Pin.getValue: 'notification_action_pin',
  NotficationActionEnum.Tag.getValue: 'notification_action_tag',
  NotficationActionEnum.Invite.getValue: 'notification_action_invite',
  NotficationActionEnum.Accept.getValue: 'notification_action_accept',
  NotficationActionEnum.Refuse.getValue: 'notification_action_refuse',
  NotficationActionEnum.SubmitHomework.getValue: 'notification_action_submit_homework',
  NotficationActionEnum.GiveHomework.getValue: 'notification_action_give_homework',
  NotficationActionEnum.Remind.getValue: 'notification_action_remind',
  //
  NotficationActionEnum.Marking.getValue: 'notification_action_marking', //Chấm điểm
  NotficationActionEnum.ConvertVideo.getValue: 'notification_action_convert_video',//Chuyển đổi video
  NotficationActionEnum.RefuseInvite.getValue: 'notification_action_refuse_invite',//Từ chối lời mời tham gia
  NotficationActionEnum.AcceptInvite.getValue: 'notification_action_accept_invite',//Chấp nhận lời mời tham gia
  NotficationActionEnum.RemoveUser.getValue: 'notification_action_remove_user',//Xóa thành viên
  NotficationActionEnum.Start.getValue: 'notification_action_start',//Bắt đầu phòng đấu
  NotficationActionEnum.Escape.getValue: 'notification_action_escape',//Thoát khỏi
};
