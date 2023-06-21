import 'package:api/exam/model/ranking/ranking_model.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Images {
  static const String url_image = 'lib/assets/images/image/';
  static const String url_image_guide = 'lib/assets/images/image_guide/';
  static const String url_image_learn = 'lib/assets/images/image_learn/';
  static const String url_image_event = 'lib/assets/images/image_event/';
  static const String url_image_chat = 'lib/assets/images/image_chat/';

  static String pathImageNamed(String name) => url_image + name + '.png';

  static const String bnd_logo = url_image + 'bnd_logo.svg';
  static const String bnd_logo_onboarding = url_image + 'bnd_logo_onboarding.svg';

  static const String icEmpty = url_image + 'ic_empty.png';
  static const String icBnd = url_image + 'bnd_icon.svg';
  static const String imageDefault = url_image + 'image_default.png';
  static const String icMinus = url_image + 'ic_minus.svg';
  static const String icPlus = url_image + 'ic_plus.svg';
  static const String icDelete = url_image + 'ic_delete.svg';
  static const String icEdit = url_image + 'ic_editor_1.svg';
  static const String icQRCode = url_image + 'qr-code.svg';
  static const String icUploadFile = url_image + 'ic_upload_file.svg';
  static const String icClear = url_image + 'ic_clear.svg';
  static const String icUploading = url_image + 'ic_uploading.svg';
  static const String icUploadSuccess = url_image + 'ic_upload_success.svg';
  static const String icUploadFail = url_image + 'ic_upload_fail.svg';
  static const String icReload = url_image + 'ic_reload.svg';
  static const String icEmptyDefault = url_image + 'ic_empty_default.png';
  static const String icEmptyExam = url_image + 'ic_empty_2.png';
  static const String icEmptyGuide = url_image + 'empty_image_guide.png';
  static const String icEmptyLearn = url_image + 'empty_image_learn.png';
  static const String icEmptyVitan = url_image + 'empty_image_vitan.png';
  static const String icBNDInc = url_image + 'ic_bnd_inc.svg';
  static const String imageBNDInc = url_image + 'image_bnd_inc.png';
  static const String icVitanNetActive = url_image + 'ic_vitan_net_active.svg';
  static const String icVitanNet = url_image + 'ic_vitan_net.svg';
  static const String imgVitanNetActive = url_image + 'img_vitan_net_active.png';
  static const String imgVitanNet = url_image + 'img_vitan_net.png';
  static const String lottieAlertCompetitionEndTime = url_image + 'exam_alert_competition.json';
  static const String lottieVoiceCompetitionEndTime = url_image + 'exam_voice_alert_competition.json';

  // static const String lottieMuteCompetitionEndTime = url_image + 'exam_mute_alert_competition.json';
  static const String svgMuteCompetitionEndTime = url_image + 'exam_mute_alert_competition.svg';

  //guide
  static const String icArrowDropDown = url_image + 'ic_arrow_drop_down.svg';

  //exam
  static const String icExamPremium = url_image + 'ic_exam_premium.svg';
  static const String imgExamPremium = url_image + 'ic_exam_premium.png';

  // download
  static const String icDownloadDoc = url_image + 'ic_download_doc.svg';
  static const String icDownloadPdf = url_image + 'ic_download_pdf.svg';
  static const String icDownloadMp4 = url_image + 'ic_download_mp4.svg';
  static const String icDownloadMp3 = url_image + 'ic_download_mp3.svg';
  static const String icDownloadPng = url_image + 'ic_download_png.svg';

  //icon block
  static const String icAdmissions = url_image + 'ic_admissions.svg'; //"Tuyen sinh"
  static const String icCareerGuidance = url_image + 'ic_career_guidance.svg'; //"Hướng nghiệp"
  static const String icVocationalTraining = url_image + 'ic_vocational_training.svg'; //"Đào tạo nghề"
  static const String icJobConnection = url_image + 'ic_job_connection.svg'; //"Kết nối việc làm"
  static const String icCareerSocialNetwork = url_image + 'ic_career_social_network.svg'; //"Mạng xã hội việc làm"
  static const String icTools = url_image + 'ic_tools.svg'; //"Bộ công cụ nghề nghiệp"
  static const String icExam = url_image + 'ic_exam.svg';
  static const String icContest = url_image + 'ic_contest.svg';
  static const String icLearn = url_image + 'ic_learn.svg';
  static const String icLearnDisable = url_image + 'ic_learn.svg';
  static const String icVitan = url_image + 'ic_vitan.svg';
  static const String icEvent = url_image + 'ic_event.svg';
  static const String icDashboardMiniApp = url_image + 'icon_dashboard_miniApp.svg';

  //icon block developing
  static const String icAdmissionsGrey = url_image + 'ic_admissions_grey.svg'; //"Tuyen sinh"
  static const String icCareerGuidanceGrey = url_image + 'ic_career_guidance_grey.svg'; //"Hướng nghiệp"
  static const String icVocationalTrainingGrey = url_image + 'ic_vocational_training_grey.svg'; //"Đào tạo nghề"
  static const String icJobConnectionGrey = url_image + 'ic_job_connection_grey.svg'; //"Kết nối việc làm"
  static const String icCareerSocialNetworkGrey =
      url_image + 'ic_career_social_network_grey.svg'; //"Mạng xã hội việc làm"
  static const String icToolsGrey = url_image + 'ic_tools_grey.svg'; //"Bộ công cụ nghề nghiệp"
  static const String icExamGrey = url_image + 'ic_exam_grey.svg';
  static const String icContestGrey = url_image + 'ic_contest_grey.svg';
  static const String icLearnGrey = url_image + 'ic_learn_grey.svg';
  static const String icEventGrey = url_image + 'ic_contest_grey.svg';

  // notification
  static const String icNotiExam = url_image + 'ic_noti_exam.svg';
  static const String icNotiAdmissions = url_image + 'ic_noti_admissions.svg';
  static const String icNotiLearn = url_image + 'ic_noti_learn.svg';
  static const String icNotiSetting = url_image + 'ic_noti_setting.svg';

  // share
  static const String icMessShare = url_image + 'ic_mess_share.svg';
  static const String icFBShare = url_image + 'ic_fb_share.svg';
  static const String icInstaShare = url_image + 'ic_instagram_share.svg';
  static const String icShare = url_image + 'ic_share.svg';

  //exam
  static const String icLearnVideo = url_image + 'ic_learn_video.svg';
  static const String bnd_string = url_image + 'bnd_string.svg';
  static const String image_background = url_image + 'image_background.svg';
  static const String bnd_string_color = url_image + 'bnd_string_color.svg';
  static const String tutorial_image = url_image + 'tutorial_image.png';
  static const String imageHomeSliderDemo = url_image + 'imageHomeSliderDemo.png';
  static const String users = url_image + 'users.svg';
  static const String backgroundImage = url_image + 'backgroundImage.svg';
  static const String group_icon = url_image + 'group_icon.svg';
  static const String notification_icon = url_image + 'notification_icon.svg';
  static const String event_icon = url_image + 'event_icon.svg';
  static const String home_icon = url_image + 'home_icon.svg';
  static const String background_image = url_image + 'background_image.png';
  static const String background_image_splash = url_image + 'background_image_splash.png';
  static const String icLogoHome = url_image + 'ic_logo_home.svg';
  static const String practice_icon = url_image + 'practice_icon.svg';
  static const String competition_icon = url_image + 'competition_icon.svg';
  static const String rank_icon = url_image + 'rank_icon.svg';
  static const String warehouse_icon = url_image + 'warehouse_icon.svg';
  static const String image_appbar = url_image + 'image_appbar.png';
  static const String menu_icon = url_image + 'menu_icon.svg';
  static const String logo = url_image + 'logo.svg';
  static const String library_icon = url_image + 'library_icon.svg';
  static const String app_bar_menu_bg_image = url_image + 'app_bar_menu_bg_image.svg';
  static const String exchange_icon = url_image + 'exchange_icon.svg';
  static const String top1_icon = url_image + 'crown.png';
  static const String comment_background = url_image + 'comment_background.svg';
  static const String heart = url_image + 'heart.svg';
  static const String heart_pink = url_image + 'heart_pink.svg';
  static const String icFavorite = url_image + 'ic_favorite.svg';
  static const String icDone = url_image + 'ic_done.svg';
  static const String icSearch = url_image + 'ic_search.svg';
  static const String exam_success_point_background = url_image + 'exam_success_point_background.png';
  static const String exam_success_cup = url_image + 'exam_success_cup.svg';
  static const String share_square = url_image + 'share_square.svg';
  static const String exam_success_star = url_image + 'exam_success_star.svg';
  static const String icCheckbox = url_image + 'ic_checkbox.svg';
  static const String icCheckboxSelected = url_image + 'ic_checkbox_selected.svg';
  static const String icChevronDown = url_image + 'ic_chevron_down.svg';
  static const String icChevronRight = url_image + 'ic_chevron_right.svg';
  static const String exclamation_point = url_image + 'exclamation_point.svg';
  static const String icCalendar = url_image + 'ic_calendar.svg';
  static const String icAddUser = url_image + 'ic_add_user.svg';
  static const String icMark = url_image + 'ic_mark.svg';
  static const String icMore = url_image + 'ic_more.svg';
  static const String icTicker = url_image + 'ic_ticker.svg';
  static const String icChevronLeft = url_image + 'ic_chevron_left.svg';
  static const String icEditor = url_image + 'ic_editor.svg';
  static const String icSearch2 = url_image + 'ic_search_2.svg';
  static const String icShare2 = url_image + 'ic_share_2.svg';
  static const String icSend = url_image + 'ic_send.svg';
  static const String icExamHome = url_image + 'ic_exam_home.svg';
  static const String icExamHomeSecond = url_image + 'ic_exam_home_second.svg';
  static const String imgVitanMenu = url_image + 'ic_vitan_menu.png';
  static const String imgVitanPlusMenu = url_image + 'ic_vitan_plus_menu.png';

  static const String icChangeCompetition = url_image + 'ic_change_competition.svg';
  static const String icTimer = url_image + 'ic_timer.svg';
  static const String icFlag = url_image + 'ic_flag.svg';
  static const String icCalendar2 = url_image + 'ic_calendar_2.svg';
  static const String lottieCompetitionComing = url_image + 'lottie_competition_coming.json';
  static const String lottieCompetitionPlaying = url_image + 'lottie_competition_playing.json';
  static const String icCategoryDefault = url_image + 'category_default.svg';
  static const String icTriangle = url_image + 'ic_triangle.svg';
  static const String icVS = url_image + 'ic_vs.svg';
  static const String icHamburger = url_image + 'ic_hamburger.svg';
  static const String icRound = url_image + 'ic_round.svg';
  static const String icChangeCompetition1 = url_image + 'ic_change_competition1.svg';
  static const String icChampionCup = url_image + 'ic_champion_cup.svg';
  static const String icTriangle2 = url_image + 'ic_triangle2.svg';
  static const String icChevronUp = url_image + 'ic_chevron_up.svg';
  static const String icClear2 = url_image + 'ic_clear2.svg';
  static const String icNavigatorCompetition = url_image + 'navigator_competition.svg';
  static const String icInCorrect = url_image + 'ic_incorrect.svg';
  static const String icCorrect = url_image + 'ic_correct.svg';
  static const String icNotion = url_image + 'ic_notion.svg';
  static const String icEditor1 = url_image + 'ic_editor_1.svg';
  static const String icDrag = url_image + 'ic_drag.svg';
  static const String icSuccess = url_image + 'ic_success.svg';
  static const String icThumbsUp = url_image + 'ic_thumbs_up.svg';
  static const String icThumbsDown = url_image + 'ic_thumbs_down.svg';
  static const String icNotion1 = url_image + 'ic_notion_1.svg';
  static const String icVerified = url_image + 'ic_verified.svg';
  static const String icVge2Calender = url_image + 'ic_vge2_calender.svg';
  static const String icCompleteExam = url_image + 'ic_complete_exam.json';
  static const String icLogout = url_image + 'ic_logout.svg';
  static const String icNotification = url_image + 'ic_notification.svg';
  static const String icShareVge5 = url_image + 'ic_share_vge5.svg';
  static const String icCup = url_image + 'ic_cup.svg';
  static const String icAdmin = url_image + 'ic_admin.svg';
  static const String imgDetailGroup = url_image + 'img_detail_group.png';
  static const String icDetailGroup = url_image + 'img_detail_group.svg';
  static const String icAvatar = url_image + 'ic_avatar.svg';
  static const String icMemberGroup = url_image + 'ic_member_group.svg';
  static const String icAddUsers = url_image + 'ic_add_users.svg';
  static const String icMessage = url_image + 'ic_message.svg';
  static const String icOfflineEvent = url_image + 'ic_offline_event.svg';
  static const String imgEvent = url_image + 'img_event.png';
  static const String icFlag1 = url_image + 'ic_flag_1.svg';
  static const String icCalendar3 = url_image + 'ic_calendar_3.svg';
  static const String icLocation = url_image + 'ic_location.svg';
  static const String imgCreateEvent = url_image + 'img_create_event.png';
  static const String icDoc = url_image + 'ic_doc.svg';
  static const String icPDF = url_image + 'ic_pdf.svg';
  static const String icMp4 = url_image + 'ic_mp4.svg';
  static const String icMp3 = url_image + 'ic_mp3.svg';
  static const String icPng = url_image + 'ic_png.svg';
  static const String icExamExist = url_image + 'ic_exam_exist.svg';
  static const String icCategory = url_image + 'ic_category.svg';
  static const String icUploadExam = url_image + 'ic_upload_exam.svg';
  static const String icMyStoreExam = url_image + 'ic_my_store.svg';
  static const String icReply = url_image + 'ic_reply.svg';
  static const String icCorrectAnswer = url_image + 'ic_correct_answer.svg';
  static const String icReAssignExam = url_image + 'ic_re_assign_exam.svg';
  static const String icCopyLink = url_image + 'ic_copy_link.svg';
  static const String icMessageHome = url_image + 'ic_message_home.svg';
  static const String icEcosystemHome = url_image + 'ic_ecosystem_home.svg';
  static const String icNotiOutline = url_image + 'ic_noti_outline.svg';
  static const String anUserMarkBackground = url_image + 'user_mark_background.json';
  static const String icInfo = url_image + 'ic_info.svg';

  //Tin tức
  static const String vnImageIcon = url_image + 'vn_image_icon';
  static const String icGroup = url_image + 'ic_group.svg';
  static const String icChooseImageComment = url_image + 'ic_choose_image_comment.svg';
  static const String icSendComment = url_image + 'ic_send_comment.svg';
  static const String vnNewsMessShare = url_image + 'vn_news_mess_share.svg';
  static const String vnNewsFBShare = url_image + 'vn_news_fb_share.svg';
  static const String vnNewsShare = url_image + 'vn_news_share.svg';
  static const String icReplyComment = url_image + 'ic_reply_comment.svg';
  static const String icEditComment = url_image + 'ic_edit_comment.svg';
  static const String icDeleteComment = url_image + 'ic_delete_comment.svg';
  static const String icClose = url_image + 'ic_close.svg';
  static const String vnNewsAfterImage = url_image + 'vn_news_after_image.png';
  static const String icDownComment = url_image + 'ic_down_comment.svg';
  static const String icComment = url_image + 'ic_comment.svg';

  // vhs
  static const String icFinger = url_image + 'vhs6_ic_biometrics.svg';
  static const String icFaceId = url_image + 'ic_face_id.svg';
  static const String vhs6Personal = url_image + 'vhs6_ic_personal.svg';
  static const String vhs6Help = url_image + 'vhs6_ic_help.svg';
  static const String vhs6Shield = url_image + 'vhs6_ic_shield.svg';
  static const String vhs6QR = url_image + 'vhs6_ic_qr.svg';
  static const String vhs6Logout = url_image + 'vhs6_ic_logout.svg';
  static const String vhs6OTP = url_image + 'vhs6_ic_otp.svg';
  static const String vhs6AdvancedSettings = url_image + 'vhs6_ic_advanced_settings.svg';
  static const String scanQrCodeThumbnail = url_image + 'scan_qr_code_thumbnail.png';
  static const String verification2StepImg = url_image + 'verification_2_step_img.png';
  static const String vhs9Filter = url_image + 'vhs9_filter.svg';
  static const String vhs9IcAdmin = url_image + 'vhs9_ic_admin.svg';
  static const String vhs9IcSeen = url_image + 'vhs9_ic_seen.svg';
  static const String vhs9IcMinusFilter = url_image + 'vhs9_ic_minus_filter.svg';
  static const String vhs9IcAddFilter = url_image + 'vhs9_ic_add_filter.svg';
  static const String icUpDown = url_image + 'ic_up_down.svg';
  static const String icExplain = url_image + 'ic_explain.svg';
  static const String icRemove = url_image + 'ic_remove.svg';
  static const String icAchievementLearning = url_image + 'ic_achievement_learning.svg';
  static const String icMySource = url_image + 'ic_my_source.svg';
  static const String icSupport = url_image + 'ic_support.svg';
  static const String icExamSystem = url_image + 'ic_exam_system.svg';
  static const String icYourExam = url_image + 'ic_your_exam.svg';
  static const String icMultipleUser = url_image + 'ic_multiple_user.svg';
  static const String icDefaultUser = url_image + 'ic_default_user.svg';
  static const String vhs3LoginBg = url_image + 'vhs3_login_bg.svg';
  static const String icLoginGoogle = url_image + 'ic_login_google.svg';
  static const String icLoginFacebook = url_image + 'ic_login_facebook.svg';
  static const String icLoginAppleId = url_image + 'ic_login_apple_id.svg';
  static const String icLoginGoogle2 = url_image + 'ic_login_google_2.svg';
  static const String icLoginFacebook2 = url_image + 'ic_facebook_2.svg';
  static const String icLoginAppleId2 = url_image + 'ic_login_apple_2.svg';

  //vhe
  static const String vhe10IcGroup = url_image + 'vhe10_ic_group.svg';
  static const String vhe10IcExam = url_image + 'vhe10_ic_exam.svg';
  static const String vhe10IcExamPackage = url_image + 'vhe1_ic_exam_package.svg';
  static const String vhe10IcExamSet = url_image + 'vhe1_ic_exam_set.svg';
  static const String vhe10IcCompetition = url_image + 'vhe10_ic_ competition.svg';
  static const String vhe13IcSupport = url_image + 'vhe13_ic_support.svg';

  //mpp
  static const String mppIcShoppingCart = url_image + 'mpp_ic_shopping_cart.svg';
  static const String mppIcActive = url_image + 'mpp_ic_active.svg';

  static const String icPremium = url_image + 'ic_premium.png';

  static const String icNoInternet = url_image + 'ic_no_internet.json';
  static const String icAdd = url_image + 'ic_add.svg';

//test
  static const String test = url_image + 'test.json';

  //guide

  static const String icExperts = url_image_guide + 'ic_experts.svg';
  static const String icMultipleChoice = url_image_guide + 'ic_multiple_choice.svg';
  static const String icMap = url_image_guide + 'ic_map.svg';
  static const String icDictionary = url_image_guide + 'ic_dictionary.svg';
  static const String ic360Vocational = url_image_guide + 'ic_360_vocational.svg';
  static const String icVG2BackgroundHeader = url_image_guide + 'ic_background_vg2_2.svg';
  static const String icVG2Rounded = url_image_guide + 'ic_vg2_rounded.svg';
  static const String icInOutline = url_image_guide + 'ic_in.svg';
  static const String icFbOutline = url_image_guide + 'ic_fb_outline.svg';
  static const String icTwitterOutline = url_image_guide + 'ic_twitter_outline.svg';
  static const String icYoutubeOutline = url_image_guide + 'ic_youtube_outline.svg';
  static const String icRoundedAvatar = url_image_guide + 'ic_rounded_avatar.svg';
  static const String icWalkMan = url_image_guide + 'walk_man.json';
  static const String icVg4DotIndicator = url_image_guide + 'vg4_dot_indicator.svg';
  static const String icCommentBackground = url_image_guide + 'ic_comment_background.svg';
  static const String icResultMultiChoice = url_image_guide + 'ic_result_multi_choice.svg';
  static const String icActionAppBar = url_image_guide + 'ic_action_appbar.svg';
  static const String icV = url_image_guide + 'ic_v.svg';
  static const String icFacebook = url_image_guide + 'ic_facebook.svg';
  static const String icTwitter = url_image_guide + 'ic_twitter.svg';
  static const String imageAppBarBackground = url_image_guide + 'image_appbar.png';
  static const String backgroundResultMultiChoice = url_image_guide + 'background_result_multi_choice.png';
  static const String icMale = url_image_guide + 'ic_male.svg';
  static const String icfemale = url_image_guide + 'ic_female.svg';
  static const String icChooseDirection = url_image_guide + 'ic_choose_direction.svg';
  static const String icInfoGuide = url_image_guide + 'ic_info_guide.svg';
  static const String backgroundChooseCategory = url_image_guide + 'background_choose_category.png';
  static const String icChangeRole = url_image_guide + 'ic_change_role.svg';
  static const String icGuideHome = url_image_guide + 'ic_guide_home.svg';
  static const String icGuideHomeSecond = url_image_guide + 'ic_guide_home_second.svg';
  static const String icQuestionMark = url_image_guide + 'ic_question_mark.svg';
  static const String icHomeDiscovery = url_image_guide + 'ic_home_discovery.svg';
  static const String imgHomeDiscovery = url_image_guide + 'img_home_discovery.png';
  static const String imgHomeChooseHolland = url_image_guide + 'img_home_choose_holland.png';
  static const String icDashboardMenu = url_image_guide + 'ic_dashboard_menu.svg';
  static const String imgFitJobHome1 = url_image_guide + 'img_fit_job_home1.png';
  static const String imgFitJobHome2 = url_image_guide + 'img_fit_job_home2.png';
  static const String icBrain = url_image_guide + 'ic_brain.svg';
  static const String icBrainleft = url_image_guide + 'ic_brain_left.svg';
  static const String icBrainRight = url_image_guide + 'ic_brain_right.svg';
  static const String icIqCheckDone = url_image_guide + 'ic_iq_check_done.svg';
  static const String icCheckboxGuideDone = url_image_guide + 'ic_check_box_guide_done.svg';
  static const String icBackgroundFitJobResult = url_image_guide + 'ic_background_fit_job_result.svg';
  static const String icBackgroundNotFitJobResult = url_image_guide + 'ic_background_not_fit_job_result.svg';
  static const String icFitJobResult = url_image_guide + 'ic_fit_job_result.svg';
  static const String icNotFitJobResult = url_image_guide + 'ic_not_fit_job_result.svg';

  //Learn
  static const String icHomeCourse = url_image_learn + 'ic_home_course.svg';
  static const String icHomePartner = url_image_learn + 'ic_home_partner.svg';
  static const String categoryCourseBg = url_image_learn + 'category_course_background.png';
  static const String icFilter = url_image_learn + 'ic_filter.svg';
  static const String icTrolley = url_image_learn + 'ic_trolley.svg';
  static const String icFlagLearn = url_image_learn + 'ic_flag.svg';
  static const String icClockCourseDetail = url_image_learn + 'ic_clock_course_detail.svg';
  static const String icStar = url_image_learn + 'ic_star.svg';
  static const String icCamera = url_image_learn + 'ic_star.svg';
  static const String icVideoCamera = url_image_learn + 'ic_learn_camera.svg';
  static const String icUserLearn = url_image_learn + 'ic_user.svg';
  static const String icShowGroupChapter = url_image_learn + 'ic_show_chapter.svg';
  static const String icCountComboCourse = url_image_learn + 'ic_count_combo_course.svg';

  static const String icPerson = url_image_learn + 'ic_person.svg';
  static const String icPersonUnFollow = url_image_learn + 'ic_person_unfollow.svg';
  static const String icCourse = url_image_learn + 'ic_course.svg';
  static const String icClockLearn = url_image_learn + 'ic_clock.svg';
  static const String icSearchLearn = url_image_learn + 'ic_search.svg';
  static const String lottieStarSuccess = url_image_learn + 'lottie_star_success.json';
  static const String icRedHeart = url_image_learn + 'ic_red_heart.svg';
  static const String icHeartLearn = url_image_learn + 'ic_heart.svg';
  static const String icPlayLesson = url_image_learn + 'ic_play_lesson.svg';
  static const String icLock = url_image_learn + 'ic_lock.svg';
  static const String icErrorLearn = url_image_learn + 'ic_error_learn.svg';
  static const String icDownloadDocument = url_image_learn + 'ic_download_document.svg';
  static const String icYellowStar = url_image_learn + 'ic_yellow_star.svg';
  static const String icTimeCourse = url_image_learn + 'ic_time_course.svg';
  static const String icMenuHeader = url_image_learn + 'ic_menu_header.svg';
  static const String icUserOutline = url_image_learn + 'ic_user_outline.svg';
  static const String icCompletedClock = url_image_learn + 'ic_completed_clock.svg';
  static const String icSchedule = url_image_learn + 'ic_schedule.svg';
  static const String icTickGreen = url_image_learn + 'ic_tick_green.svg';
  static const String icTickShield = url_image_learn + 'ic_tick_shield.svg';
  static const String icTriangleCombo = url_image_learn + 'ic_triangle_combo.svg';
  static const String icCompletedCourseGreenTick = url_image_learn + 'ic_completed_course_green_tick.svg';
  static const String icLearnHome = url_image_learn + 'ic_learn_home.svg';
  static const String icFollow = url_image_learn + 'ic_follow.svg';
  static const String icCoursePersonal = url_image_learn + 'ic_course_personal.svg';
  static const String icLearnHomeSecond = url_image_learn + 'ic_learn_home_second.svg';
  static const String icLearnCalendar = url_image_learn + 'ic_calendar.svg';

  //Event
  static const String icEventHome = url_image_event + 'ic_event_home.svg';
  static const String icEventHomeSecond = url_image_event + 'ic_event_home_second.svg';
  static const String icEventBackgroundCard = url_image_event + 'ic_background_card.png';
  static const String icMyEvent = url_image_event + 'ic_my_event.svg';
  static const String icEventDone = url_image_event + 'ic_event_done.svg';
  static const String icEventLocation = url_image_event + 'ic_event_location.svg';
  static const String icEventPin = url_image_event + 'ic_event_pin.svg';
  static const String icEventShare = url_image_event + 'ic_event_share.svg';
  static const String icEventContact = url_image_event + 'ic_contact.svg';
  static const String icEventComment = url_image_event + 'ic_comment.svg';
  static const String icEventQuestion = url_image_event + 'ic_question.svg';
  static const String icEventSetting = url_image_event + 'ic_setting.svg';
  static const String icEventTicket = url_image_event + 'ic_ticket.svg';
  static const String icEventHeart = url_image_event + 'ic_heart.svg';
  static const String icEventEmpty = url_image_event + 'ic_empty_event.svg';
  static const String icEventPersonal = url_image_event + 'ic_person.svg';
  static const String icEventGroup = url_image_event + 'ic_group.svg';
  static const String icBackgroundCheckIn = url_image_event + 'ic_background_check_in.png';
  static const String icQuestion = url_image_event + 'ic_event_question.svg';

  static const String icEventDelete = url_image_event + 'ic_delete_event.svg';
  static const String icEventLocation1 = url_image_event + 'ic_event_location_1.svg';
  static const String icEventCalendarRatting = url_image_event + 'ic_calendar_ratting.svg';
  static const String icEventArrowRight = url_image_event + 'ic_arrow_right.svg';
  static const String icEventUpload = url_image_event + 'ic_upload_event.svg';
  static const String icEventAdd = url_image_event + 'ic_add_event.svg';
  static const String icEventCalendar1 = url_image_event + 'ic_calendar_1.svg';
  static const String icEventQrCode = url_image_event + 'ic_qr_code.svg';

  static const String icEventCopyLink = url_image_event + 'ic_event_copy_link.png';
  static const String icEventFacebook = url_image_event + 'ic_event_facebook.png';
  static const String icEventInstagram = url_image_event + 'ic_event_instagram.png';
  static const String icEventMassage = url_image_event + 'ic_event_massage.png';
  static const String icEventMessenger = url_image_event + 'ic_event_messenger.png';
  static const String icEventSkype = url_image_event + 'ic_event_skype.png';
  static const String icEventTwitter = url_image_event + 'ic_event_twitter.png';
  static const String icEventWhatsApp = url_image_event + 'ic_event_whats_app.png';
  static const String icEventPlayVideo = url_image_event + 'ic_play_video.svg';
  static const String icEventPinYellow = url_image_event + 'ic_event_pin_yellow.svg';
  //Chat

  static const String icDocument = url_image_chat + 'ic_document.svg';
  static const String icEmoJi = url_image_chat + 'ic_emoji.svg';
  static const String icAttachment = url_image_chat + 'ic_attachment.svg';
  static const String icGallery = url_image_chat + 'ic_gallery.svg';
  static const String icSendMessage = url_image_chat + 'ic_send_message.svg';

  static Widget svgAssets(
    String path, {
    String package = 'core',
    Color? color,
    double? width,
    double? height,
    bool cacheColorFilter = false,
    BoxFit fit = BoxFit.contain,
  }) {
    if (path.contains("http")) {
      if (path.contains('jpg') || path.contains('png'))
        return BNDImage(imageUrl: path, width: width, height: height, fit: fit);
      return SvgPicture.network(
        path,
        cacheColorFilter: cacheColorFilter,
        color: color,
        width: width,
        height: height,
        fit: fit,
      );
    }

    return SvgPicture.asset(
      path,
      package: package,
      cacheColorFilter: cacheColorFilter,
      color: color,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
