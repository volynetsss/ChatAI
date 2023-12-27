import Foundation

enum LocalizationKeys: String {
    
    //first screen of onboarding
    case onboardTitleFirst = "onboard_title_first"
    case onboardDetailFirst = "onboard_detail_first"
    
    //second screen of onboarding
    case onboardTitleSecond = "onboard_title_second"
    case onboardDetailSecond = "onboard_detail_second"
    
    //third screen of onboarding
    case onboardTitleThird = "onboard_title_third"
    case onboardDetailThird = "onboard_detail_third"
    case onboardDescTrialTitle = "onboard_desc_trial_title"
    
    case onboardPointFirstTitle = "onboard_point_first_title"
    case onboardPointFirstDesc = "onboard_point_first_desc"
    
    case onboardPointSecondTitle = "onboard_point_second_title"
    case onboardPointSecondDesc = "onboard_point_second_desc"
    
    case onboardPointThirdTitle = "onboard_point_third_title"
    case onboardPointThirdDesc = "onboard_desc_point_third"
    
    case onboardSubmitButton = "onboard_btn_submit_trial"
    
    //common items
    case onboardNextButton = "onboard_btn_next"
    case onboardVersionText = "onboard_version"
    
    //ChatsScreen - createAlert
    case chatCreateTitle = "chat_create_alert_title"
    case chatCreateAlertPlaceholder = "chat_create_alert_placeholder"
    case chatCreateAlertCreateAction = "chat_create_alert_create_action"
    case chatCreateAlertCancelAction = "chat_create_alert_cancel_action"
    case chatErrorAlertTitle = "chat_error_alert_title"
    
    //ChatsScreen
    case chatsScreenTitle = "chats_screen_title"
    case chatsScreenSearchFieldPlaceholder = "chats_screen_search_field_placeholder"
    
    //ContextMenu
    case contextMenuActionCopy = "context_menu_action_copy"
    case contextMenuActionReanswer = "context_menu_action_reanswer"
    
    //For Validation
    case errorTitle = "error_title"
    case errorChatNameBig = "error_chat_name_big"
    case errorChatNameIsBlank = "error_chat_name_is_blank"
    
    case errorChatNameAlreadyExist = "error_chat_name_already_exist"
    
    case errorMessageIsBlank = "error_message_is_blank"
}
