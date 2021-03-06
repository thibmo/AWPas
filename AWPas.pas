unit AWPas;

interface

uses
  Classes, SysUtils {$IFDEF MSWindows}, Windows{$ENDIF};

const
  {$IFDEF BUILD64}
  libName = 'aw64.dll';
  {$ELSE}
  libName = 'aw.dll';
  {$ENDIF}

  AW_BUILD = 101;     // All AW 5.2 and later, backward compatble to build 65

  // Limits
  AW_MAX_AVCHANGE_PER_SECOND = 10;
  AW_MAX_MESSAGES_PER_SECOND = 100;
  AW_MAX_WHISPERS_PER_SECOND = 100;
  AW_MAX_BOTGRAMS_PER_SECOND = 32 ;
  AW_CELL_MIN                = -32767;  // Provided for old applications only
  AW_MAX_ATTRIBUTE_LENGTH    = 255;
  AW_MAX_USER_NAME_LENGTH    = 20;
  AW_MIN_USER_NAME_LENGTH    = 2;
  AW_MAX_PASSWORD_LENGTH     = 16;
  AW_MIN_PASSWORD_LENGTH     = 4;
  AW_MAX_EMAIL_LENGTH        = 64;
  AW_MAX_WORLD_NAME_LENGTH   = 16;
  AW_MAX_LONG_DATA           = 4094;

  AW_PERSONAL_AVATAR     = 65535;
  AW_CUSTOM_AVATAR       = 65534;
  AW_CUSTOM_WORLD_AVATAR = 65533;

  // Object versions
  AW_OBJECT_VERSION_CAMERA    = 1;
  AW_OBJECT_VERSION_PARTICLES = 1;
  AW_OBJECT_VERSION_ZONE      = 1;
  AW_OBJECT_VERSION_MOVER     = 1;
  AW_OBJECT_VERSION_CLOTH     = 1;

type
  AW_ATTRIBUTE = (
    AW_LOGIN_NAME,
    AW_LOGIN_PASSWORD,
    AW_LOGIN_OWNER,
    AW_LOGIN_PRIVILEGE_PASSWORD,
    AW_LOGIN_PRIVILEGE_NUMBER,
    AW_LOGIN_PRIVILEGE_NAME,
    AW_LOGIN_APPLICATION,
    AW_LOGIN_EMAIL,
    AW_UNIVERSE_BROWSER_MINIMUM,
    AW_UNIVERSE_BROWSER_RELEASE,
    AW_UNIVERSE_BROWSER_BETA,
    AW_UNIVERSE_WORLD_MINIMUM,
    AW_UNIVERSE_WORLD_START,
    AW_UNIVERSE_REGISTRATION_REQUIRED,
    AW_UNIVERSE_BUILD_NUMBER,
    AW_UNIVERSE_MONTHLY_CHARGE,
    AW_UNIVERSE_ANNUAL_CHARGE,
    AW_UNIVERSE_REGISTER_METHOD,
    AW_UNIVERSE_TIME,
    AW_UNIVERSE_CITIZEN_CHANGES_ALLOWED,
    AW_UNIVERSE_BROWSER_RELEASE_22,
    AW_UNIVERSE_WELCOME_MESSAGE,
    AW_UNIVERSE_WORLD_RELEASE,
    AW_UNIVERSE_WORLD_BETA,
    AW_UNIVERSE_ALLOW_TOURISTS,
    AW_UNIVERSE_SEARCH_URL,
    AW_UNIVERSE_NOTEPAD_URL,
    AW_UNIVERSE_NAME,
    AW_UNIVERSE_USER_LIST_ENABLED,
    AW_CITIZEN_NUMBER,
    AW_CITIZEN_NAME,
    AW_CITIZEN_PASSWORD,
    AW_CITIZEN_EMAIL,
    AW_CITIZEN_TIME_LEFT,
    AW_CITIZEN_PRIVILEGE_PASSWORD,
    AW_CITIZEN_IMMIGRATION_TIME,
    AW_CITIZEN_EXPIRATION_TIME,
    AW_CITIZEN_BETA,
    AW_CITIZEN_LAST_LOGIN,
    AW_CITIZEN_BOT_LIMIT,
    AW_CITIZEN_TOTAL_TIME,
    AW_CITIZEN_ENABLED,
    AW_CITIZEN_COMMENT,
    AW_CITIZEN_URL,
    AW_WORLD_NAME,
    AW_WORLD_TITLE,
    AW_WORLD_BACKDROP,
    AW_WORLD_GROUND,
    AW_WORLD_OBJECT_PATH,
    AW_WORLD_OBJECT_REFRESH,
    AW_WORLD_BUILD_RIGHT,
    AW_WORLD_EMINENT_DOMAIN_RIGHT,
    AW_WORLD_ENTER_RIGHT,
    AW_WORLD_SPECIAL_OBJECTS_RIGHT,
    AW_WORLD_FOG_RED,
    AW_WORLD_FOG_GREEN,
    AW_WORLD_FOG_BLUE,
    AW_WORLD_CARETAKER_CAPABILITY,
    AW_WORLD_RESTRICTED_RADIUS,
    AW_WORLD_PUBLIC_SPEAKER_CAPABILITY,
    AW_WORLD_PUBLIC_SPEAKER_RIGHT,
    AW_WORLD_CREATION_TIMESTAMP,
    AW_WORLD_HOME_PAGE,
    AW_WORLD_BUILD_NUMBER,
    AW_WORLD_OBJECT_PASSWORD,
    AW_WORLD_DISABLE_CREATE_URL,
    AW_WORLD_RATING,
    AW_WORLD_WELCOME_MESSAGE,
    AW_WORLD_EJECT_RIGHT,
    AW_WORLD_EJECT_CAPABILITY,
    AW_WORLD_CELL_LIMIT,
    AW_WORLD_BUILD_CAPABILITY,
    AW_WORLD_ALLOW_PASSTHRU,
    AW_WORLD_ALLOW_FLYING,
    AW_WORLD_ALLOW_TELEPORT,
    AW_WORLD_ALLOW_OBJECT_SELECT,
    AW_WORLD_BOTS_RIGHT,
    AW_WORLD_SPEAK_CAPABILITY,
    AW_WORLD_SPEAK_RIGHT,
    AW_WORLD_ALLOW_TOURIST_WHISPER,
    AW_WORLD_LIGHT_X,
    AW_WORLD_LIGHT_Y,
    AW_WORLD_LIGHT_Z,
    AW_WORLD_LIGHT_RED,
    AW_WORLD_LIGHT_GREEN,
    AW_WORLD_LIGHT_BLUE,
    AW_WORLD_AMBIENT_LIGHT_RED,
    AW_WORLD_AMBIENT_LIGHT_GREEN,
    AW_WORLD_AMBIENT_LIGHT_BLUE,
    AW_WORLD_ALLOW_AVATAR_COLLISION,
    AW_WORLD_FOG_ENABLE,
    AW_WORLD_FOG_MINIMUM,
    AW_WORLD_FOG_MAXIMUM,
    AW_WORLD_FOG_TINTED,
    AW_WORLD_MAX_USERS,
    AW_WORLD_SIZE,
    AW_WORLD_OBJECT_COUNT,
    AW_WORLD_EXPIRATION,
    AW_WORLD_SPECIAL_COMMANDS_RIGHT,
    AW_WORLD_MAX_LIGHT_RADIUS,
    AW_WORLD_SKYBOX,
    AW_WORLD_MINIMUM_VISIBILITY,
    AW_WORLD_REPEATING_GROUND,
    AW_WORLD_KEYWORDS,
    AW_WORLD_ENABLE_TERRAIN,
    AW_WORLD_ALLOW_3_AXIS_ROTATION,
    AW_WORLD_TERRAIN_TIMESTAMP,
    AW_WORLD_ENTRY_POINT,
    AW_WORLD_SKY_NORTH_RED,
    AW_WORLD_SKY_NORTH_GREEN,
    AW_WORLD_SKY_NORTH_BLUE,
    AW_WORLD_SKY_SOUTH_RED,
    AW_WORLD_SKY_SOUTH_GREEN,
    AW_WORLD_SKY_SOUTH_BLUE,
    AW_WORLD_SKY_EAST_RED,
    AW_WORLD_SKY_EAST_GREEN,
    AW_WORLD_SKY_EAST_BLUE,
    AW_WORLD_SKY_WEST_RED,
    AW_WORLD_SKY_WEST_GREEN,
    AW_WORLD_SKY_WEST_BLUE,
    AW_WORLD_SKY_TOP_RED,
    AW_WORLD_SKY_TOP_GREEN,
    AW_WORLD_SKY_TOP_BLUE,
    AW_WORLD_SKY_BOTTOM_RED,
    AW_WORLD_SKY_BOTTOM_GREEN,
    AW_WORLD_SKY_BOTTOM_BLUE,
    AW_WORLD_CLOUDS_LAYER1_TEXTURE,
    AW_WORLD_CLOUDS_LAYER1_MASK,
    AW_WORLD_CLOUDS_LAYER1_TILE,
    AW_WORLD_CLOUDS_LAYER1_SPEED_X,
    AW_WORLD_CLOUDS_LAYER1_SPEED_Z,
    AW_WORLD_CLOUDS_LAYER1_OPACITY,
    AW_WORLD_CLOUDS_LAYER2_TEXTURE,
    AW_WORLD_CLOUDS_LAYER2_MASK,
    AW_WORLD_CLOUDS_LAYER2_TILE,
    AW_WORLD_CLOUDS_LAYER2_SPEED_X,
    AW_WORLD_CLOUDS_LAYER2_SPEED_Z,
    AW_WORLD_CLOUDS_LAYER2_OPACITY,
    AW_WORLD_CLOUDS_LAYER3_TEXTURE,
    AW_WORLD_CLOUDS_LAYER3_MASK,
    AW_WORLD_CLOUDS_LAYER3_TILE,
    AW_WORLD_CLOUDS_LAYER3_SPEED_X,
    AW_WORLD_CLOUDS_LAYER3_SPEED_Z,
    AW_WORLD_CLOUDS_LAYER3_OPACITY,
    AW_WORLD_DISABLE_CHAT,
    AW_WORLD_ALLOW_CITIZEN_WHISPER,
    AW_WORLD_ALWAYS_SHOW_NAMES,
    AW_WORLD_DISABLE_AVATAR_LIST,
    AW_WORLD_AVATAR_REFRESH_RATE,
    AW_WORLD_WATER_TEXTURE,
    AW_WORLD_WATER_MASK,
    AW_WORLD_WATER_BOTTOM_TEXTURE,
    AW_WORLD_WATER_BOTTOM_MASK,
    AW_WORLD_WATER_OPACITY,
    AW_WORLD_WATER_RED,
    AW_WORLD_WATER_GREEN,
    AW_WORLD_WATER_BLUE,
    AW_WORLD_WATER_LEVEL,
    AW_WORLD_WATER_SURFACE_MOVE,
    AW_WORLD_WATER_WAVE_MOVE,
    AW_WORLD_WATER_SPEED,
    AW_WORLD_WATER_ENABLED,
    AW_WORLD_EMINENT_DOMAIN_CAPABILITY,
    AW_WORLD_LIGHT_TEXTURE,
    AW_WORLD_LIGHT_MASK,
    AW_WORLD_LIGHT_DRAW_SIZE,
    AW_WORLD_LIGHT_DRAW_FRONT,
    AW_WORLD_LIGHT_DRAW_BRIGHT,
    AW_WORLD_LIGHT_SOURCE_USE_COLOR,
    AW_WORLD_LIGHT_SOURCE_COLOR,
    AW_WORLD_TERRAIN_AMBIENT,
    AW_WORLD_TERRAIN_DIFFUSE,
    AW_WORLD_WATER_VISIBILITY,
    AW_WORLD_SOUND_FOOTSTEP,
    AW_WORLD_SOUND_WATER_ENTER,
    AW_WORLD_SOUND_WATER_EXIT,
    AW_WORLD_SOUND_AMBIENT,
    AW_WORLD_GRAVITY,
    AW_WORLD_BUOYANCY,
    AW_WORLD_FRICTION,
    AW_WORLD_WATER_FRICTION,
    AW_WORLD_SLOPESLIDE_ENABLED,
    AW_WORLD_SLOPESLIDE_MIN_ANGLE,
    AW_WORLD_SLOPESLIDE_MAX_ANGLE,
    AW_WORLD_ALLOW_TOURIST_BUILD,
    AW_WORLD_ENABLE_REFERER,
    AW_WORLD_WATER_UNDER_TERRAIN,
    AW_WORLD_TERRAIN_OFFSET,
    AW_WORLD_VOIP_RIGHT,
    AW_WORLD_DISABLE_MULTIPLE_MEDIA,
    AW_WORLD_BOTMENU_URL,
    AW_WORLD_ENABLE_BUMP_EVENT,
    AW_WORLD_ENABLE_SYNC_EVENTS,
    AW_WORLD_ENABLE_CAV,
    AW_WORLD_ENABLE_PAV,
    AW_WORLD_CHAT_DISABLE_URL_CLICKS,
    AW_WORLD_MOVER_EMPTY_RESET_TIMEOUT,
    AW_WORLD_MOVER_USED_RESET_TIMEOUT,
    AW_MY_X,
    AW_MY_Y,
    AW_MY_Z,
    AW_MY_YAW,
    AW_MY_PITCH,
    AW_MY_TYPE,
    AW_MY_GESTURE,
    AW_MY_STATE,
    AW_AVATAR_SESSION,
    AW_AVATAR_NAME,
    AW_AVATAR_X,
    AW_AVATAR_Y,
    AW_AVATAR_Z,
    AW_AVATAR_YAW,
    AW_AVATAR_PITCH,
    AW_AVATAR_TYPE,
    AW_AVATAR_GESTURE,
    AW_AVATAR_STATE,
    AW_AVATAR_ADDRESS,
    AW_AVATAR_VERSION,
    AW_AVATAR_CITIZEN,
    AW_AVATAR_PRIVILEGE,
    AW_AVATAR_LOCK,
    AW_AVATAR_FLAGS,
    AW_CHAT_SESSION,
    AW_CHAT_MESSAGE,
    AW_CELL_X,
    AW_CELL_Z,
    AW_CELL_SEQUENCE,
    AW_CELL_SIZE,
    AW_CELL_ITERATOR,
    AW_CELL_COMBINE,
    AW_OBJECT_ID,
    AW_OBJECT_NUMBER,
    AW_OBJECT_X,
    AW_OBJECT_Y,
    AW_OBJECT_Z,
    AW_OBJECT_YAW,
    AW_OBJECT_TILT,
    AW_OBJECT_ROLL,
    AW_OBJECT_MODEL,
    AW_OBJECT_DESCRIPTION,
    AW_OBJECT_ACTION,
    AW_OBJECT_OLD_NUMBER,
    AW_OBJECT_OLD_X,
    AW_OBJECT_OLD_Z,
    AW_OBJECT_OWNER,
    AW_OBJECT_SESSION,
    AW_OBJECT_BUILD_TIMESTAMP,
    AW_OBJECT_SYNC,
    AW_OBJECT_TYPE,
    AW_OBJECT_DATA,
    AW_QUERY_COMPLETE,
    AW_CHAT_TYPE,
    AW_LICENSE_NAME,
    AW_LICENSE_PASSWORD,
    AW_LICENSE_USERS,
    AW_LICENSE_RANGE,
    AW_LICENSE_EMAIL,
    AW_LICENSE_COMMENT,
    AW_LICENSE_CREATION_TIME,
    AW_LICENSE_EXPIRATION_TIME,
    AW_LICENSE_LAST_START,
    AW_LICENSE_LAST_ADDRESS,
    AW_LICENSE_HIDDEN,
    AW_LICENSE_ALLOW_TOURISTS,
    AW_LICENSE_VOIP,
    AW_LICENSE_PLUGINS,
    AW_WORLDLIST_NAME,
    AW_WORLDLIST_STATUS,
    AW_WORLDLIST_USERS,
    AW_WORLDLIST_RATING,
    AW_WORLDLIST_MORE,
    AW_EJECT_SESSION,
    AW_EJECT_DURATION,
    AW_EJECTION_TYPE,
    AW_EJECTION_ADDRESS,
    AW_EJECTION_EXPIRATION_TIME,
    AW_EJECTION_CREATION_TIME,
    AW_EJECTION_COMMENT,
    AW_DISCONNECT_REASON,
    AW_FILE_RECIPIENT,
    AW_FILE_SENDER,
    AW_FILE_SENDER_NAME,
    AW_FILE_SESSION,
    AW_FILE_ADDRESS,
    AW_FILE_PORT,
    AW_CLICKED_SESSION,
    AW_CLICKED_NAME,
    AW_URL_NAME,
    AW_URL_POST,
    AW_URL_TARGET,
    AW_URL_TARGET_3D,
    AW_TELEPORT_WORLD,
    AW_TELEPORT_X,
    AW_TELEPORT_Y,
    AW_TELEPORT_Z,
    AW_TELEPORT_YAW,
    AW_TELEPORT_WARP,
    AW_SERVER_BUILD,
    AW_SERVER_NAME,
    AW_SERVER_PASSWORD,
    AW_SERVER_REGISTRY,
    AW_SERVER_CARETAKERS,
    AW_SERVER_ID,
    AW_SERVER_INSTANCE,
    AW_SERVER_ENABLED,
    AW_SERVER_STATE,
    AW_SERVER_USERS,
    AW_SERVER_MAX_USERS,
    AW_SERVER_OBJECTS,
    AW_SERVER_SIZE,
    AW_SERVER_EXPIRATION,
    AW_SERVER_START_RC,
    AW_SERVER_MORE,
    AW_SERVER_TERRAIN_NODES,
    AW_TERRAIN_X,
    AW_TERRAIN_Z,
    AW_TERRAIN_PAGE_X,
    AW_TERRAIN_PAGE_Z,
    AW_TERRAIN_NODE_X,
    AW_TERRAIN_NODE_Z,
    AW_TERRAIN_NODE_SIZE,
    AW_TERRAIN_NODE_TEXTURE_COUNT,
    AW_TERRAIN_NODE_HEIGHT_COUNT,
    AW_TERRAIN_NODE_TEXTURES,
    AW_TERRAIN_NODE_HEIGHTS,
    AW_TERRAIN_SEQUENCE,
    AW_TERRAIN_COMPLETE,
    AW_TERRAIN_VERSION_NEEDED,
    AW_ENTER_GLOBAL,
    AW_CONSOLE_RED,
    AW_CONSOLE_GREEN,
    AW_CONSOLE_BLUE,
    AW_CONSOLE_BOLD,
    AW_CONSOLE_ITALICS,
    AW_CONSOLE_MSG,
    AW_BOTGRAM_TO,
    AW_BOTGRAM_FROM,
    AW_BOTGRAM_FROM_NAME,
    AW_BOTGRAM_TYPE,
    AW_BOTGRAM_TEXT,
    AW_TOOLBAR_ID,
    AW_TOOLBAR_SESSION,
    AW_USERLIST_MORE,
    AW_USERLIST_NAME,
    AW_USERLIST_WORLD,
    AW_USERLIST_EMAIL,
    AW_USERLIST_CITIZEN,
    AW_USERLIST_PRIVILEGE,
    AW_USERLIST_STATE,
    AW_USERLIST_ADDRESS,
    AW_USERLIST_ID,
    AW_SOUND_NAME,
    AW_CAMERA_LOCATION_TYPE,
    AW_CAMERA_LOCATION_OBJECT,
    AW_CAMERA_LOCATION_SESSION,
    AW_CAMERA_TARGET_TYPE,
    AW_CAMERA_TARGET_OBJECT,
    AW_CAMERA_TARGET_SESSION,
    AW_PLUGIN_STRING,
    AW_BOTMENU_TO_SESSION,
    AW_BOTMENU_FROM_NAME,
    AW_BOTMENU_FROM_SESSION,
    AW_BOTMENU_QUESTION,
    AW_BOTMENU_ANSWER,

    // attributes below are not used by the SDK
    AW_CONTACT_NUMBER,
    AW_CONTACT_STATUS,
    AW_CONTACT_NAME,
    AW_CONTACT_WORLD,
    AW_CONTACT_MORE,
    AW_CONTACT_OPTIONS,
    AW_TELEGRAM_TO,
    AW_TELEGRAM_FROM,
    AW_TELEGRAM_TEXT,
    AW_TELEGRAM_SENT,
    AW_TELEGRAM_MORE,
    AW_JOIN_NAME,
    AW_JOIN_CITIZEN,
    AW_JOIN_WORLD,
    AW_JOIN_X,
    AW_JOIN_Y,
    AW_JOIN_Z,
    AW_JOIN_YAW,
    AW_REGISTER_CC_NAME,
    AW_REGISTER_CC_NUMBER,
    AW_REGISTER_CC_MONTH,
    AW_REGISTER_CC_YEAR,
    AW_REGISTER_ADDRESS,
    AW_REGISTER_CITY,
    AW_REGISTER_STATE,
    AW_REGISTER_ZIP,
    AW_REGISTER_PHONE_NUMBER,
    AW_REGISTER_BUSINESS_NAME,
    AW_REGISTER_VENDOR,
    AW_REGISTER_RESULT,
    AW_REGISTER_METHOD,
    AW_VOIP_DAT,

    // attributes below are used by the SDK
    AW_UNIVERSE_CAV_PATH,
    AW_CITIZEN_PAV_ENABLED,
    AW_CAV_CITIZEN,
    AW_CAV_DEFINITION,
    AW_ENTITY_TYPE,
    AW_ENTITY_ID,
    AW_ENTITY_STATE,
    AW_ENTITY_FLAGS,
    AW_ENTITY_X,
    AW_ENTITY_Y,
    AW_ENTITY_Z,
    AW_ENTITY_YAW,
    AW_ENTITY_PITCH,
    AW_ENTITY_ROLL,
    AW_ENTITY_OWNER_SESSION,
    AW_ENTITY_OWNER_CITIZEN,
    AW_AVATAR_DISTANCE,
    AW_AVATAR_ANGLE,
    AW_AVATAR_Y_DELTA,
    AW_AVATAR_YAW_DELTA,
    AW_AVATAR_PITCH_DELTA,
    AW_AVATAR_WORLD_INSTANCE,
    AW_ATTRIB_SENDER_SESSION,
    AW_ENTITY_MODEL_NUM,
    AW_WORLD_V4_OBJECTS_RIGHT,
    AW_CITIZEN_LAST_ADDRESS,
    AW_HUD_ELEMENT_TYPE,
    AW_HUD_ELEMENT_ID,
    AW_HUD_ELEMENT_SESSION,
    AW_HUD_ELEMENT_ORIGIN,
    AW_HUD_ELEMENT_X,
    AW_HUD_ELEMENT_Y,
    AW_HUD_ELEMENT_Z,
    AW_HUD_ELEMENT_FLAGS,
    AW_HUD_ELEMENT_TEXT,
    AW_HUD_ELEMENT_COLOR,
    AW_HUD_ELEMENT_OPACITY,
    AW_HUD_ELEMENT_SIZE_X,
    AW_HUD_ELEMENT_SIZE_Y,
    AW_HUD_ELEMENT_SIZE_Z,
    AW_HUD_ELEMENT_CLICK_X,
    AW_HUD_ELEMENT_CLICK_Y,
    AW_HUD_ELEMENT_CLICK_Z,
    AW_HUD_ELEMENT_TEXTURE_OFFSET_X,
    AW_HUD_ELEMENT_TEXTURE_OFFSET_Y,

    AW_CITIZEN_PRIVACY,
    AW_CITIZEN_TRIAL,
    AW_UNIVERSE_CAV_PATH2,
    AW_WORLD_DISABLE_SHADOWS,
    AW_WORLD_ENABLE_CAMERA_COLLISION,
    AW_WORLD_SPECIAL_COMMANDS,
    AW_UNIVERSE_OBJECT_REFRESH,
    AW_UNIVERSE_OBJECT_PASSWORD,
    AW_CAV_SESSION,
    AW_CITIZEN_CAV_ENABLED,
    AW_WORLD_CAV_OBJECT_PATH,
    AW_WORLD_CAV_OBJECT_PASSWORD,
    AW_WORLD_CAV_OBJECT_REFRESH,
    AW_OBJECT_CALLBACK_REFERENCE,
    AW_WORLD_TERRAIN_RIGHT,
    AW_UNIVERSE_ALLOW_TOURISTS_CAV,
    AW_UNIVERSE_ALLOW_BOTS_CAV,
    AW_WORLD_VOIP_CONFERENCE_GLOBAL,
    AW_WORLD_VOIP_MODERATE_GLOBAL,
    AW_OBJECT_SESSION_TO,
    AW_WORLD_CAMERA_ZOOM,
    AW_WORLD_WAIT_LIMIT,

    AW_XFER_DISCONNECT_REASON,
    AW_XFER_TYPE,
    AW_XFER_FROM_SESSION,
    AW_XFER_FROM_NAME,
    AW_XFER_TO_SESSION,
    AW_XFER_TO_NAME,
    AW_XFER_TO_WORLD_NAME,
    AW_XFER_TO_ZONE_NAME,
    AW_XFER_TO_TAG_NAME,
    AW_XFER_DATA_ID,
    AW_XFER_DATA_FILE_NAME,
    AW_XFER_DATA_LEN_TOTAL,
    AW_XFER_DATA_LEN_OFFSET,
    AW_XFER_DATA,
    AW_XFER_DATA2,
    AW_XFER_DATA3,
    AW_XFER_DATA_MORE,
    AW_XFER_RC,
    AW_XFER_SHOW_NAME,
    AW_XFER_OPTIONS,
    AW_XFER_EXPIRATION,
    AW_LICENSE_XFER_SHOW_RIGHTS,
    AW_XFER_SHOW_CAPABILITY,
    AW_XFER_SHOW_SEQUENCE,

    AW_LASER_BEAM_SOURCE_TYPE,
    AW_LASER_BEAM_SOURCE_ID,
    AW_LASER_BEAM_SOURCE_X,
    AW_LASER_BEAM_SOURCE_Y,
    AW_LASER_BEAM_SOURCE_Z,
    AW_LASER_BEAM_TARGET_TYPE,
    AW_LASER_BEAM_TARGET_ID,
    AW_LASER_BEAM_TARGET_X,
    AW_LASER_BEAM_TARGET_Y,
    AW_LASER_BEAM_TARGET_Z,
    AW_LASER_BEAM_STYLE,
    AW_LASER_BEAM_COLOR,
    AW_LASER_BEAM_DEFINITION,

    AW_WORLD_VOIPCAST_HOST,
    AW_WORLD_VOIPCAST_PORT,

    AW_MY_ZONE,
    AW_AVATAR_ZONE,

    AW_UNIVERSE_PER_CITIZEN_CAV,

    AW_XFER_OWNER,

    AW_WORLD_ENABLE_WIREFRAME,

    AW_SHOPITEM_ID,
    AW_SHOPITEM_CREATION,
    AW_SHOPITEM_EXPIRATION,
    AW_SHOPITEM_PRICE,
    AW_SHOPITEM_TYPE,
    AW_SHOPITEM_CATEGORY,
    AW_SHOPITEM_DESCRIPTION,
    AW_SHOPITEM_OBJECT,
    AW_SHOPITEM_DEFINITION,

    AW_SHOPTRANS_ID,
    AW_SHOPTRANS_CITIZEN,
    AW_SHOPTRANS_ITEMID,
    AW_SHOPTRANS_AMOUNT,
    AW_SHOPTRANS_DATE,
    AW_SHOPTRANS_SELLER,
    AW_SHOPTRANS_COMMENT,
    AW_SHOPTRANS_TOTAL,
    AW_SHOPTRANS_ITERATOR,
    AW_SHOPTRANS_MORE,

    AW_SHOPITEM_CHANGED,
    AW_LICENSE_SHOP,

    AW_CITIZEN_PWD_EXP,
    AW_UNIVERSE_EXPIRATION_DATE,
    AW_UNIVERSE_IMMIGRATION,
    AW_CITIZEN_SEC_PASSWORD,

    AW_CHAT_CHANNEL,
    AW_CHAT_CITIZEN,
    AW_WORLD_CHAT_CHANNEL1_NAME,
    AW_WORLD_CHAT_CHANNEL2_NAME,
    AW_WORLD_CHAT_CHANNEL3_NAME,
    AW_WORLD_CHAT_CHANNEL4_NAME,
    AW_WORLD_CHAT_CHANNEL5_NAME,
    AW_WORLD_CHAT_CHANNEL1_COLOR,
    AW_WORLD_CHAT_CHANNEL2_COLOR,
    AW_WORLD_CHAT_CHANNEL3_COLOR,
    AW_WORLD_CHAT_CHANNEL4_COLOR,
    AW_WORLD_CHAT_CHANNEL5_COLOR,

    AW_WORLDLIST_BOTS,

    AW_MAX_ATTRIBUTE
  );

  AW_EVENT_ATTRIBUTE = (
    AW_EVENT_AVATAR_ADD,
    AW_EVENT_AVATAR_CHANGE,
    AW_EVENT_AVATAR_DELETE,
    AW_EVENT_CELL_BEGIN,
    AW_EVENT_CELL_OBJECT,
    AW_EVENT_CELL_END,
    AW_EVENT_CHAT,
    AW_EVENT_OBJECT_ADD,
    AW_EVENT_OBJECT_DELETE,
    AW_EVENT_UNIVERSE_ATTRIBUTES,
    AW_EVENT_UNIVERSE_DISCONNECT,
    AW_EVENT_WORLD_ATTRIBUTES,
    AW_EVENT_WORLD_INFO,
    AW_EVENT_WORLD_DISCONNECT,
    AW_EVENT_SEND_FILE,
    AW_EVENT_CONTACT_STATE,
    AW_EVENT_TELEGRAM,
    AW_EVENT_JOIN,
    AW_EVENT_OBJECT_CLICK,
    AW_EVENT_OBJECT_SELECT,
    AW_EVENT_AVATAR_CLICK,
    AW_EVENT_URL,
    AW_EVENT_URL_CLICK,
    AW_EVENT_TELEPORT,
    AW_EVENT_ADMIN_WORLD_INFO,
    AW_EVENT_ADMIN_WORLD_DELETE,
    AW_EVENT_TERRAIN_BEGIN,
    AW_EVENT_TERRAIN_DATA,
    AW_EVENT_TERRAIN_END,
    AW_EVENT_CONSOLE_MESSAGE,
    AW_EVENT_TERRAIN_CHANGED,
    AW_EVENT_BOTGRAM,
    AW_EVENT_TOOLBAR_CLICK,
    AW_EVENT_USER_INFO,
    AW_EVENT_VOIP_DATA,
    AW_EVENT_NOISE,
    AW_EVENT_CAMERA,
    AW_EVENT_BOTMENU,
    AW_EVENT_OBJECT_BUMP,
    AW_EVENT_ENTITY_ADD,
    AW_EVENT_ENTITY_CHANGE,
    AW_EVENT_ENTITY_DELETE,
    AW_EVENT_ENTITY_RIDER_ADD,
    AW_EVENT_ENTITY_RIDER_DELETE,
    AW_EVENT_ENTITY_RIDER_CHANGE,
    AW_EVENT_AVATAR_RELOAD,
    AW_EVENT_ENTITY_LINKS,
    AW_EVENT_HUD_CLICK,
    AW_EVENT_HUD_CREATE,
    AW_EVENT_HUD_DESTROY,
    AW_EVENT_HUD_CLEAR,
    AW_EVENT_CAV_DEFINITION_CHANGE,
    AW_EVENT_WORLD_CAV_DEFINITION_CHANGE,

    AW_EVENT_XFER_DISCONNECT,
    AW_EVENT_XFER_OFFER,
    AW_EVENT_XFER_REPLY,
    AW_EVENT_XFER_SEND,
    AW_EVENT_XFER_REQUEST,
    AW_EVENT_XFER_CANCEL,

    AW_EVENT_LASER_BEAM,
    AW_EVENT_XFER_QUERY,

    AW_EVENT_CAV_TEMPLATE_CHANGE,

    AW_MAX_EVENT
  );

  TAW_CALLBACK = (
    AW_CALLBACK_CREATE,
    AW_CALLBACK_LOGIN,
    AW_CALLBACK_ENTER,
    AW_CALLBACK_OBJECT_RESULT,
    AW_CALLBACK_LICENSE_ATTRIBUTES,
    AW_CALLBACK_LICENSE_RESULT,
    AW_CALLBACK_CITIZEN_ATTRIBUTES,
    AW_CALLBACK_CITIZEN_RESULT,
    AW_CALLBACK_QUERY,
    AW_CALLBACK_WORLD_LIST,
    AW_CALLBACK_SEND_FILE,
    AW_CALLBACK_JOIN,
    AW_CALLBACK_PASSWORD_SEND,
    AW_CALLBACK_IMMIGRATE,
    AW_CALLBACK_REGISTER,
    AW_CALLBACK_UNIVERSE_EJECTION,
    AW_CALLBACK_UNIVERSE_EJECTION_RESULT,
    AW_CALLBACK_ADDRESS,
    AW_CALLBACK_WORLD_EJECTION,
    AW_CALLBACK_WORLD_EJECTION_RESULT,
    AW_CALLBACK_ADMIN_WORLD_LIST,
    AW_CALLBACK_ADMIN_WORLD_RESULT,
    AW_CALLBACK_DELETE_ALL_OBJECTS_RESULT,
    AW_CALLBACK_CELL_RESULT,
    AW_CALLBACK_RELOAD_REGISTRY,
    AW_CALLBACK_ATTRIBUTES_RESET_RESULT,
    AW_CALLBACK_ADMIN,
    AW_CALLBACK_CONTACT_ADD,
    AW_CALLBACK_TELEGRAM_RESULT,
    AW_CALLBACK_TERRAIN_SET_RESULT,
    AW_CALLBACK_TERRAIN_NEXT_RESULT,
    AW_CALLBACK_TERRAIN_DELETE_ALL_RESULT,
    AW_CALLBACK_TERRAIN_LOAD_NODE_RESULT,
    AW_CALLBACK_BOTGRAM_RESULT,
    AW_CALLBACK_USER_LIST,
    AW_CALLBACK_BOTMENU_RESULT,
    AW_CALLBACK_CAV,
    AW_CALLBACK_CAV_RESULT,
    AW_CALLBACK_WORLD_INSTANCE,
    AW_CALLBACK_HUD_RESULT,
    AW_CALLBACK_AVATAR_LOCATION,
    AW_CALLBACK_OBJECT_QUERY,
    AW_CALLBACK_WORLD_CAV_RESULT,
    AW_CALLBACK_WORLD_CAV,
    AW_CALLBACK_XFER_LOGIN,
    AW_CALLBACK_XFER_REQUEST_SHOW_REPLY,
    AW_CALLBACK_CAV_TEMPLATE_RESULT,
    AW_CALLBACK_SHOPITEM_ATTRIBUTES,
    AW_CALLBACK_SHOPITEM_RESULT,
    AW_CALLBACK_SHOPITEM_QUERY,
    AW_CALLBACK_SHOPTRANS_TOTAL,
    AW_CALLBACK_SHOPTRANS_RESULT,
    AW_CALLBACK_SHOPTRANS_BUY_RESULT,
    AW_CALLBACK_SHOPTRANS_LIST,
    AW_MAX_CALLBACK
  );

  AW_CHAT_TYPES = (
    AW_CHAT_DISCONNECT = -1,      // disconnect from all chat channels
    AW_CHAT_SAID,
    AW_CHAT_BROADCAST,
    AW_CHAT_WHISPER
  );

  AW_CHAT_CHANNELS = (
    AW_CHAT_CHANNEL_NONE     = $00000000,  // backward compatibility, defaults to LOCAL
    AW_CHAT_CHANNEL_LOCAL    = $00000001,  // LOCAL neighborhood
    AW_CHAT_CHANNEL_GLOBAL   = $00000002,  // GLOBAL / worldwide
    AW_CHAT_CHANNEL_WORLD1   = $00000010,  // WORLD defined #1
    AW_CHAT_CHANNEL_WORLD2   = $00000020,  // WORLD defined #2
    AW_CHAT_CHANNEL_WORLD3   = $00000040,  // WORLD defined #3
    AW_CHAT_CHANNEL_WORLD4   = $00000080,  // WORLD defined #4
    AW_CHAT_CHANNEL_WORLD5   = $00000100,  // WORLD defined #5
    AW_CHAT_CHANNEL_UNIVERSE = $01000000   // UNIVERSAL
  );

  AW_CONTACT_STATES = (
    AW_CONTACT_OFFLINE,
    AW_CONTACT_ONLINE,
    AW_CONTACT_NOT_A_CITIZEN,
    AW_CONTACT_AFK,
    AW_CONTACT_UNKNOWN,
    AW_CONTACT_DEL
  );

  AW_WORLD_STATES = (
    AW_WORLDSTATUS_UNKNOWN,
    AW_WORLDSTATUS_PUBLIC,
    AW_WORLDSTATUS_PRIVATE,
    AW_WORLDSTATUS_STOPPED
  );

  AW_SERVER_STATES = (
    AW_SERVER_STOPPED,
    AW_SERVER_STARTING,
    AW_SERVER_START_WAIT,
    AW_SERVER_RUNNING
  );

  AW_CONNECTION_TYPES = (
    AW_CONNECTION_DIRECT,
    AW_CONNECTION_FIREWALL_NO_PROXY,
    AW_CONNECTION_PROXY_AUTO,
    AW_CONNECTION_PROXY_NO_AUTH,
    AW_CONNECTION_PROXY_BASIC,
    AW_CONNECTION_PROXY_AUTH_NTLM,
    AW_CONNECTION_MAX
  );

  AW_CONNECTION_STATES = (
    AW_CONNECTION_STATE_NOT_CONNECTED,
    AW_CONNECTION_STATE_CONNECTING_TO_PROXY,
    AW_CONNECTION_STATE_NEGOTIATING_WITH_PROXY,
    AW_CONNECTION_STATE_CONNECTING_TO_TUNNEL,
    AW_CONNECTION_STATE_CONNECTING_TO_UNIVERSE,
    AW_CONNECTION_STATE_CONNECTED,
    AW_CONNECTION_STATE_PASSWORD_REQUIRED
  );

  AW_EJECTION_TYPES = (
    AW_EJECT_BY_ADDRESS,
    AW_EJECT_BY_COMPUTER,
    AW_EJECT_BY_CITIZEN
  );

  AW_AVATAR_STATES = (
    AW_AVATAR_STATE_WALKING,
    AW_AVATAR_STATE_RUNNING,
    AW_AVATAR_STATE_FLYING,
    AW_AVATAR_STATE_SWIMMING,
    AW_AVATAR_STATE_FALLING,
    AW_AVATAR_STATE_JUMPING,
    AW_AVATAR_STATE_WARPING,
    AW_AVATAR_STATE_RIDING,
    AW_AVATAR_STATE_SLIDING1,
    AW_AVATAR_STATE_SLIDING2,
    AW_AVATAR_STATE_SLIDING3,
    AW_AVATAR_STATE_CLIMBING
  );

  AW_ZONE_TYPES = (
    AW_ZONE_TYPE_CUBE,
    AW_ZONE_TYPE_CYLINDER,
    AW_ZONE_TYPE_SPHERE
  );

  AW_PARTICLE_TYPES = (
    AW_PARTICLE_TYPE_SPRITE,
    AW_PARTICLE_TYPE_FACER,
    AW_PARTICLE_TYPE_FLAT,
    AW_PARTICLE_TYPE_OBJECT
  );

  AW_PARTICLE_DRAW_STYLES = (
    AW_PARTICLE_DRAW_NORMAL,
    AW_PARTICLE_DRAW_BRIGHT,
    AW_PARTICLE_DRAW_GLOW
  );

  AW_CAMERA_TYPES = (
    AW_CAMERA_TRACK_DEFAULT,
    AW_CAMERA_TRACK_AVATAR,
    AW_CAMERA_TRACK_OBJECT,
    AW_CAMERA_TRACK_AHEAD,
    AW_CAMERA_TRACK_SELF_FIRST_PERSON,
    AW_CAMERA_TRACK_SELF_LOCKED,
    AW_CAMERA_TRACK_SELF_CHASE,
    AW_CAMERA_TRACK_SELF_FRONT
  );

  AW_REGISTER_METHODS = (
    AW_REGISTER_MONTHLY,
    AW_REGISTER_ANNUAL,
    AW_REGISTER_USER
  );

  AW_AVATAR_SET_FLAGS = (
    AW_AVATAR_SET_NONE     = $00,
    AW_AVATAR_SET_POSITION = $01,
    AW_AVATAR_SET_TYPE     = $02,
    AW_AVATAR_SET_GESTURE  = $04,
    AW_AVATAR_SET_STATE    = $08
  );

  AW_ENTITY_TYPES = (
    AW_ENTITY_AVATAR, // not used as such
    AW_ENTITY_MOVER
  );

  AW_MOVER_STATE_TYPES = (
    AW_MOVER_STATE_IDLE,    // never set by SDK
    AW_MOVER_STATE_START,
    AW_MOVER_STATE_MOVE,    // never set by SDK
    AW_MOVER_STATE_PAUSE,
    AW_MOVER_STATE_CONTINUE,
    AW_MOVER_STATE_STOP,
    AW_MOVER_STATE_RESET
  );

AW_MOVER_FLAGS = (
  AW_MOVER_FLAG_LOOP                  = $00000001,
  AW_MOVER_FLAG_USE_OBJTAG            = $00000002,
  AW_MOVER_FLAG_BUMP_ADD              = $00000004,
  AW_MOVER_FLAG_CLICK_START           = $00000008,
  AW_MOVER_FLAG_CLICK_PAUSE           = $00000010,
  AW_MOVER_FLAG_LOCK_POSITION         = $00000020,
  AW_MOVER_FLAG_LOCK_YAW              = $00000040,
  AW_MOVER_FLAG_LOCK_PITCH            = $00000080,
  AW_MOVER_FLAG_SINGLE_RIDER          = $00000100,
  AW_MOVER_FLAG_NO_AUTO_YAW           = $00000200,
  AW_MOVER_FLAG_EMPTY_RESET           = $00000400,
  AW_MOVER_FLAG_DISABLE_FLYING        = $00000800,
  AW_MOVER_FLAG_KEEP_ON_WATER         = $00001000,
  AW_MOVER_FLAG_DISABLE_UPWARDS       = $00002000,
  AW_MOVER_FLAG_INVISIBLE_AV          = $00004000,
  AW_MOVER_FLAG_EXIT_EJECT_UP         = $00008000,
  AW_MOVER_FLAG_EXIT_NON_SOLID        = $00010000,
  AW_MOVER_FLAG_AV_APPLY_TILT_X       = $00020000,
  AW_MOVER_FLAG_AV_APPLY_TILT_Z       = $00040000,
  AW_MOVER_FLAG_OBJECT_LINK           = $00080000,
  AW_MOVER_FLAG_DISABLE_MOVE          = $00100000,
  AW_MOVER_FLAG_TILT_BY_TERRAIN       = $00200000,
  AW_MOVER_FLAG_DISABLE_EXPL_SEQS     = $00400000,
  AW_MOVER_FLAG_DISABLE_TURN_ON_PLACE = $00800000,
  AW_MOVER_FLAG_DISABLE_TELEPORTS     = $01000000,
  AW_MOVER_FLAG_DETACH_ON_TELEPORT    = $02000000
  );

  AW_MOVER_TYPES = (
    AW_MOVER_TYPE_PASSIVE,
    AW_MOVER_TYPE_ACTIVE,
    AW_MOVER_TYPE_ITEM
  );

  AW_ZONE_FLAGS = (
    AW_ZONE_FLAG_WATER             = $001,
    AW_ZONE_FLAG_BLOCK_PARTICLES   = $002,
    AW_ZONE_FLAG_BLOCK_LIGHTS      = $004,
    AW_ZONE_FLAG_BLOCK_WORLD_LIGHT = $008,
    AW_ZONE_FLAG_BLOCK_CHAT        = $010,
    AW_ZONE_FLAG_VISIBLE           = $020,
    AW_ZONE_FLAG_BLOCK_JOIN        = $040,
    AW_ZONE_FLAG_VOIP              = $080,
    AW_ZONE_FLAG_BLOCK_AUDIO       = $100
  );

  AW_PARTICLE_FLAGS = (
    AW_PARTICLE_FLAG_INTERPOLATE    = $01,
    AW_PARTICLE_FLAG_GRAVITY        = $02,
    AW_PARTICLE_FLAG_COLLIDE_ZONES  = $04,
    AW_PARTICLE_FLAG_ZONE_EXCLUSIVE = $08,
    AW_PARTICLE_FLAG_CAMERA_EMIT    = $10,
    AW_PARTICLE_FLAG_MOVER_LINK     = $20,
    AW_PARTICLE_FLAG_DRAW_IN_FRONT  = $40,
    AW_PARTICLE_FLAG_APPLY_ROTATION = $80
  );

  AW_CAMERA_FLAGS = (
    AW_CAMERA_FLAG_TRACK_USER = $01
  );

  AW_CLOTH_TYPES = (
    AW_CLOTH_TYPE_FABRIC,
    AW_CLOTH_TYPE_OBJECT,
    AW_CLOTH_TYPE_METAL_SHAPE
  );

  AW_CLOTH_FLAGS = (
    AW_CLOTH_FLAG_GRAVITY             = $0001,
    AW_CLOTH_FLAG_STATIC              = $0002,
    AW_CLOTH_FLAG_COMDAMPING          = $0004,
    AW_CLOTH_FLAG_BENDING_ORTHO       = $0008,
    AW_CLOTH_FLAG_SELFCOLLISION       = $0010,
    AW_CLOTH_FLAG_COLLISION_TWO_WAY   = $0020,
    AW_CLOTH_FLAG_ATTACHMENT_TWO_WAY  = $0040,
    AW_CLOTH_FLAG_ATTACHMENT_TEARABLE = $0080,
    AW_CLOTH_FLAG_TEARABLE            = $0100,
    AW_CLOTH_FLAG_TEARABLE_DIAGONAL   = $0200, // fabric only
    AW_CLOTH_FLAG_PRESSURE            = $0400, // closed convex hulls only
    AW_CLOTH_FLAG_ADHERE              = $0800,
    AW_CLOTH_FLAG_UNTANGLING          = $1000,
    AW_CLOTH_FLAG_HARD_STRETCH_LIMIT  = $2000,
    AW_CLOTH_FLAG_TEX_NO_MIRROR       = $4000
  );

  AW_CLOTH_ANCHORS = (
    AW_CLOTH_ANCHOR_NONE,
    AW_CLOTH_ANCHOR_GLOBAL,
    AW_CLOTH_ANCHOR_OBJECT
  );

  AW_CLOTH_ANCHOR_POS = (
    AW_CLOTH_ANCHOR_POS_CENTER,
    AW_CLOTH_ANCHOR_POS_TOP,
    AW_CLOTH_ANCHOR_POS_BOTTOM,
    AW_CLOTH_ANCHOR_POS_LEFT,
    AW_CLOTH_ANCHOR_POS_RIGHT,
    AW_CLOTH_ANCHOR_POS_TOP_LEFT,
    AW_CLOTH_ANCHOR_POS_TOP_RIGHT,
    AW_CLOTH_ANCHOR_POS_BOTTOM_LEFT,
    AW_CLOTH_ANCHOR_POS_BOTTOM_RIGHT
  );

  AW_CLOTH_FABRIC_SHAPES = (
    AW_CLOTH_FABRIC_SHAPE_QUAD,
    AW_CLOTH_FABRIC_SHAPE_DISC
  );

  AW_CLOTH_METAL_SHAPES = (
    AW_CLOTH_METAL_SHAPE_BOX,
    AW_CLOTH_METAL_SHAPE_SPHERE,
    AW_CLOTH_METAL_SHAPE_CAPSULE
  );

  AW_OBJECT_TYPES = (
    AW_OBJECT_TYPE_V3,
    AW_OBJECT_TYPE_UNKNOWN,
    AW_OBJECT_TYPE_ZONE,
    AW_OBJECT_TYPE_PARTICLES,
    AW_OBJECT_TYPE_MOVER,
    AW_OBJECT_TYPE_CAMERA,
    AW_OBJECT_TYPE_CLOTH,
    AW_MAX_OBJECT_TYPES
  );

  AW_HUD_ORIGIN_TYPES = (
    AW_HUD_ORIGIN_TOP_LEFT,
    AW_HUD_ORIGIN_TOP,
    AW_HUD_ORIGIN_TOP_RIGHT,
    AW_HUD_ORIGIN_LEFT,
    AW_HUD_ORIGIN_CENTER,
    AW_HUD_ORIGIN_RIGHT,
    AW_HUD_ORIGIN_BOTTOM_LEFT,
    AW_HUD_ORIGIN_BOTTOM,
    AW_HUD_ORIGIN_BOTTOM_RIGHT
  );

  AW_HUD_TYPES = (
    AW_HUD_TYPE_TEXT,
    AW_HUD_TYPE_IMAGE,
    AW_HUD_TYPE_MODEL
  );

  AW_HUD_ELEMENT_FLAGS_ENUM = (
    AW_HUD_ELEMENT_FLAG_CLICKS        = $0001,
    AW_HUD_ELEMENT_FLAG_STRETCH       = $0002,
    AW_HUD_ELEMENT_FLAG_ADDITIVE      = $0004,
    AW_HUD_ELEMENT_FLAG_SIZE_PERCENT  = $0008,
    AW_HUD_ELEMENT_FLAG_TRANSITION    = $0010,
    AW_HUD_ELEMENT_FLAG_TEMPORARY     = $0020,
    AW_HUD_ELEMENT_FLAG_UNIVERSE_PATH = $0040,
    AW_HUD_ELEMENT_FLAG_CLAMP         = $0080,
    AW_HUD_ELEMENT_FLAG_HIGHLIGHT     = $0100
  );

  AW_PRIVACY_TYPES = (
    AW_PRIVACY_BLOCK_TELEGRAMS = $0001
  );

  //  AW_WORLD_ENABLE_CAV flags
  AW_ENABLE_CAV_TYPES = (
    AW_ENABLE_CAV_CITIZEN       = $01,
    AW_ENABLE_CAV_BOT           = $02,
    AW_ENABLE_CAV_TOURIST       = $04,
    AW_ENABLE_CAV_WORLD_CITIZEN = $10,
    AW_ENABLE_CAV_WORLD_BOT     = $20,
    AW_ENABLE_CAV_WORLD_TOURIST = $40
  );

  // AW_XFER_TYPE
  AW_XFER_TYPES = (
    AW_XFER_TYPE_FILE,
    AW_XFER_TYPE_IMAGE,
    AW_XFER_TYPE_DOCUMENT,
    AW_XFER_TYPE_MEDIA,
    AW_XFER_TYPE_STORE,		// file to store
    AW_XFER_TYPE_RETRIEVE	// file to retrieve
  );

  // AW_LASER_BEAM_SOURCE_TYPE
  AW_LASER_BEAM_SOURCE_TYPES = (
    AW_LASER_BEAM_SOURCE_TYPE_NONE,
    AW_LASER_BEAM_SOURCE_TYPE_AVATAR,
    AW_LASER_BEAM_SOURCE_TYPE_OBJECT,
    AW_LASER_BEAM_SOURCE_TYPE_COORDS
  );

  // AW_LASER_BEAM_TARGET_TYPE
  AW_LASER_BEAM_TARGET_TYPES = (
    AW_LASER_BEAM_TARGET_TYPE_NONE,
    AW_LASER_BEAM_TARGET_TYPE_AVATAR,
    AW_LASER_BEAM_TARGET_TYPE_OBJECT,
    AW_LASER_BEAM_TARGET_TYPE_COORDS
  );

  // AW_LASER_BEAM_STYLE
  AW_LASER_BEAM_STYLES = (
    AW_LASER_BEAM_STYLE_LINE,
    AW_LASER_BEAM_STYLE_PARTICLE
  );

  // AW_SHOPITEM_TYPE
  AW_SHOPITEM_TYPES = (
    AW_SHOPITEM_TYPE_CAV
  );

  // 3D vector
  aw_type_vector = record
    x: Single;
    y: Single;
    z: Single;
  end;

  // 3D vector range, min and max
  aw_type_vector_range = record
    min: aw_type_vector;
    max: aw_type_vector;
  end;

  { Object data structures }
  // AW_OBJECT_TYPE_ZONE
  aw_object_data_zone = packed record
    size:            aw_type_vector;   // BBox, MUST be first item in struct!
    version:         Byte;             // structure version (set by SDK)
    shape:           Byte;
    priority:        AnsiChar;
    gravity:         Single;
    friction:        Single;
    flags:           Word;             // boolean flags
    color:           LongInt;          // COLORREF
    fog_min:         Word;
    fog_max:         Word;
    footstep_len:    Word;             // length of 1st string in str_data
    ambient_len:     Word;             // length of 2nd string in str_data
    camera_len:      Byte;             // length of 3rd string in str_data
    target_cur_len:  Byte;             // length of 4th string in str_data
    voip_rights_len: Byte;             // length of 5th string in str_data
    name_len:        Byte;             // length of 6th string in str_data
    reserved: array[0..8] of AnsiChar; // Bytes reserverd for future use
    { note: Increase the strucure's total size by the length of the strings
            when allocating memory for this structure!
            (str_data is the reference to the first byte) }
    str_data:        AnsiChar;
  end;

  // AW_OBJECT_TYPE_PARTICLES
  aw_object_data_particles = packed record
    volume:           aw_type_vector_range;     // BBox, MUST be first item in struct!
    version:          Byte;                     // structure version (set by SDK)
    speed:            aw_type_vector_range;
    accel:            aw_type_vector_range;
    angle:            aw_type_vector_range;
    spin:             aw_type_vector_range;
    size:             aw_type_vector_range;
    release_min:      LongInt;                  // time in ms
    release_max:      LongInt;                  // time in ms
    release_size:     Word;                     // # of particles released
    lifespan:         LongInt;                  // time in ms
    emitter_lifespan: LongInt;                  // time in ms
    fade_in:          LongInt;                  // time in ms
    fade_out:         LongInt;                  // time in ms
    color_start:      LongInt;                  // COLORREF
    color_end:        LongInt;                  // COLORREF
    opacity:          Single;
    render_style:     Byte;
    flags:            Word;                     // boolean flags (interp, collide, gravity)
    style:            Byte;
    asset_list_len:   Word;                     // length of 1st string in str_data
    name_len:         Byte;                     // length of 2nd string in str_data
    reserved: array[0..11] of AnsiChar;         // Bytes reserverd for future use
    { note: Increase the strucure's total size by the length of the strings
            when allocating memory for this structure!
            (str_data is the reference to the first byte) }
    str_data:         AnsiChar;
  end;

  // AW_OBJECT_TYPE_CLOTH
  aw_object_data_cloth = packed record
    version:                  Byte;      // structure version (set by SDK)
    _type:                    Byte;      // AW_CLOTH_TYPES
    shape:                    Byte;      // AW_CLOTH_FABRIC_SHAPES + AW_CLOTH_METAL_SHAPES
    flags:                    FixedUInt; // AW_CLOTH_FLAGS
    anchor_type:              Byte;      // AW_CLOTH_ANCHORS
    anchor_pos:               Byte;      // AW_CLOTH_ANCHOR_POS, for fabric
    // pose definitions
    anchor_offset:            aw_type_vector; // offset to anchor, 'local pose'
    orientation:              aw_type_vector; // normalized rotation angles
    // sizes
    dimension:                aw_type_vector; // dimension for fabric, scaling for models
    resolution:               Byte;           // fabric only, divisor to size
    // render options
    opacity:                  Single;
    color:                    FixedUInt; // COLORREF
    time_till_static:         Single;    // time in seconds
    // physics behavior
    bending_stiffness:        Single;
    stretching_stiffness:     Single;
    compression_limit:        Single;
    compression_stiffness:    Single;
    hard_stretch_limit:       Single;
    damping_coeff:            Single;
    collision_response:       Single;
    tear_factor:              Single;
    attachment_response:      Single;
    attachment_tear_factor:   Single;
    min_adhere_velocity:      Single;
    // physics properties
    density:                  Single;         // mass = 1/3 * triangleArea * density
    thickness:                Single;
    friction:                 Single;
    pressure:                 Single;         // closed convex hull models only
    wind:                     aw_type_vector; // wind acceleration on vertex normals
    valid_bounds:             aw_type_vector; // triangles outside these bounds are not simulated
    // AW_CLOTH_TYPE_METAL_SHAPE only:
    impulse_threshold:        Single;
    penetration_depth:        Single;
    max_deformation_distance: Single;
    // appendices
    name_len:                 Byte;     // length of 1st string in str_data, the object's own name
    anchor_len:               Byte;     // length of 2nd string in str_data, anchor name
    texture_len:              Byte;     // length of 3rd string in str_data, texture name
    model_len:                Byte;     // length of 4th string in str_data, model name
    reserved: array[0..31] of AnsiChar; // Bytes reserverd for future use
    { note: Increase the strucure's total size by the length of the strings
            when allocating memory for this structure!
            (str_data is the reference to the first byte) }
    str_data:                 AnsiChar;
  end;

  // AW_OBJECT_TYPE_CAMERA
  aw_object_data_camera = packed record
    version:  Byte;                     // structure version (set by SDK)
    flags:    Word;
    zoom:     Single;
    name_len: Byte;                     // length of 1st string in str_data
    reserved: array[0..11] of AnsiChar; // Bytes reserverd for future use
    { note: Increase the strucure's total size by the length of the strings
            when allocating memory for this structure!
           (str_data is the reference to the first byte) }
    str_data: AnsiChar;
  end;

  // AW_OBJECT_TYPE_MOVER
  aw_object_data_mover = packed record
    version:         Byte;              // structure version (set by SDK)
    _type:           Byte;
    flags:           FixedUInt;
    locked_pos_x:    SmallInt;
    locked_pos_y:    SmallInt;
    locked_pos_z:    SmallInt;
    locked_yaw:      SmallInt;
    locked_pitch:    SmallInt;
    glide_factor:    ShortInt;          // -100 to +100
    speed_factor:    Byte;              // 0.0 to 25.5 max (* 10)
    friction_factor: Byte;              // 0.0 to 25.5 max (* 10)
    accel_tilt_x:    ShortInt;          // -127 to +127
    accel_tilt_z:    ShortInt;          // -127 to +127
    turn_factor:     Byte;              // 0.0 to 25.5 max (* 10)
    avatar_tag:      Byte;              // 0 to 255
    reserved1: array[0..8] of AnsiChar; // Bytes reserverd for future use
    name_len:        Byte;              // length of 1st string in str_data
    seq_len:         Byte;              // length of 2nd string in str_data
    script_len:      Byte;              // length of 3rd string in str_data
    sound_len:       Byte;              // length of 4rd string in str_data
    waypoints_len:   Word;              // length of 5th string in str_data
    bump_name_len:   Byte;              // length of 6th string in str_data
    reserved2: array[0..1] of AnsiChar; // Bytes reserverd for future use
    { note: Increase the strucure's total size by the length of the strings
            when allocating memory for this structure!
            (str_data is the reference to the first byte) }
    str_data:        AnsiChar;
  end;

  aw_waypoint = packed record
    x:     SmallInt;
    y:     SmallInt;
    z:     SmallInt;
    yaw:   SmallInt;
    pitch: SmallInt;
    roll:  SmallInt;
    speed: Word;
    pause: Byte;
    flag:  Word;
  end;

  TCallBack      = procedure(rc: Integer) of object;
  TDebugCallback = procedure(debug_string: AnsiString) of object;
  THandler       = procedure of object;
  TQueryArray    = array[0..2] of array[0..2] of Integer;
  TQueryArrayBig = array[0..4] of array[0..4] of Integer;

  Paw_type_vector           = ^aw_type_vector;
  Paw_type_vector_range     = ^aw_type_vector_range;
  Paw_object_data_zone      = ^aw_object_data_zone;
  Paw_object_data_particles = ^aw_object_data_particles;
  Paw_object_data_cloth     = ^aw_object_data_cloth;
  Paw_object_data_camera    = ^aw_object_data_camera;
  Paw_object_data_mover     = ^aw_object_data_mover;
  Paw_waypoint              = ^aw_waypoint;

// Initializers and destroyers
function  aw_sdk_build: Integer; cdecl;
function  aw_init(build: Integer): Integer; cdecl;
function  aw_init_bind(build: Integer; Addr: LongInt): Integer; cdecl;
procedure aw_term; cdecl;
function  aw_create(const domain: AnsiString; port: Integer; instance: PPointer): Integer; cdecl;
function  aw_createW(const domain: WideString; port: Integer; instance: PPointer): Integer; cdecl;
function  aw_create_resolved(address: LongInt; port: Integer; instance: PPointer): Integer; cdecl;
function  aw_destroy: Integer; cdecl;
// Instance handlers
function aw_instance: Pointer; cdecl;
function aw_instance_set(instance: Pointer): Integer; cdecl;
function aw_instance_wait(instance: Pointer): Integer; cdecl;
function aw_instance_callback_set(c: TAW_CALLBACK; callback: TCallBack): Integer; cdecl;
function aw_instance_event_set(a: AW_EVENT_ATTRIBUTE; handler: THandler): Integer; cdecl;
// Login
function aw_login: Integer; cdecl;
// Event handlers
procedure aw_event(a: AW_EVENT_ATTRIBUTE); cdecl;
function  aw_event_set(a: AW_EVENT_ATTRIBUTE; handler: THandler): Integer; cdecl;
// Callbacks
function aw_callback(c: TAW_CALLBACK): TCallBack; cdecl;
function aw_callback_set(c: TAW_CALLBACK; callback: TCallBack): Integer; cdecl;
// World handlers
function aw_enter(const world: AnsiString): Integer; cdecl;
function aw_enterW(const world: WideString): Integer; cdecl;
function aw_exit: Integer; cdecl;
function aw_world_attributes_change: Integer; cdecl;
function aw_world_eject: Integer; cdecl;
function aw_world_ejection_add: Integer; cdecl;
function aw_world_ejection_delete: Integer; cdecl;
function aw_world_ejection_lookup: Integer; cdecl;
function aw_world_ejection_next: Integer; cdecl;
function aw_world_ejection_previous: Integer; cdecl;
function aw_world_attribute_set(attribute: Integer; value: AnsiString): Integer; cdecl;
function aw_world_attribute_setW(attribute: Integer; value: WideString): Integer; cdecl;
function aw_world_attribute_get(attribute: Integer; read_only: PInteger; value: AnsiString): Integer; cdecl;
function aw_world_attribute_getW(attribute: Integer; read_only: PInteger; value: WideString): Integer; cdecl;
function aw_world_reload_registry: Integer; cdecl;
function aw_world_attributes_reset: Integer; cdecl;
function aw_world_instance_set(citizen, world_instance: Integer): Integer; cdecl;
function aw_world_instance_get(citizen: Integer): Integer; cdecl;
function aw_world_attributes_send(session_id: Integer): Integer; cdecl;
// Universe handlers
function aw_universe_attributes_change: Integer; cdecl;
function aw_universe_ejection_add: Integer; cdecl;
function aw_universe_ejection_delete(address: Integer): Integer; cdecl;
function aw_universe_ejection_lookup: Integer; cdecl;
function aw_universe_ejection_next: Integer; cdecl;
function aw_universe_ejection_previous: Integer; cdecl;
// Chat handlers
function aw_listen(const channels: Integer): Integer; cdecl;
function aw_say_channel(const _message: AnsiString; const channel: Integer): Integer; cdecl;
function aw_say_channelW(const _message: WideString; const channel: Integer): Integer; cdecl;
function aw_say(const _message: AnsiString): Integer; cdecl;
function aw_sayW(const _message: WideString): Integer; cdecl;
function aw_whisper(session_id: Integer; const _message: AnsiString): Integer; cdecl;
function aw_whisperW(session_id: Integer; const _message: WideString): Integer; cdecl;
function aw_console_message(session_id: Integer): Integer; cdecl;
function aw_botgram_send: Integer; cdecl;
// Citizen handlers
function aw_citizen_attributes_by_name(const name: AnsiString): Integer; cdecl;
function aw_citizen_attributes_by_nameW(const name: WideString): Integer; cdecl;
function aw_citizen_attributes_by_number(citizen: Integer): Integer; cdecl;
function aw_citizen_add: Integer; cdecl;
function aw_citizen_change: Integer; cdecl;
function aw_citizen_delete(citizen: Integer): Integer; cdecl;
function aw_citizen_next: Integer; cdecl;
function aw_citizen_previous: Integer; cdecl;
// CAV handlers
function aw_cav_request(citizen, session: Integer): Integer; cdecl;
function aw_cav_change: Integer; cdecl;
function aw_cav_delete: Integer; cdecl;
function aw_world_cav_request(citizen, session: Integer): Integer; cdecl;
function aw_world_cav_change: Integer; cdecl;
function aw_world_cav_delete: Integer; cdecl;
{$IF Defined(AW_BROWSER) or Defined(AW_STATIC)}
function aw_cav_template_request(citizen, rebuild: Integer): Integer; cdecl;
function aw_cav_template_get(buf: PByte; maxLen: Integer): Integer; cdecl;
// Shop handlers
function aw_shopitem_query(number, mod_date: Integer): Integer; cdecl;
function aw_shopitem_by_id(number: Integer): Integer; cdecl;
function aw_shopitem_by_desc(_type: Integer, const name: AnsiString): Integer; cdecl;
function aw_shopitem_by_descW(_type: Integer, const name: WideString): Integer; cdecl;
function aw_shopitem_add: Integer; cdecl;
function aw_shopitem_change: Integer; cdecl;
function aw_shopitem_next: Integer; cdecl;
function aw_shopitem_previous: Integer; cdecl;
function aw_shoptrans_total(citizen, recalc: Integer): Integer; cdecl;
function aw_shoptrans_buy: Integer; cdecl;
function aw_shoptrans_add: Integer; cdecl;
function aw_shoptrans_list(citizen, iterator: Integer): Integer; cdecl;
// Crypto
function aw_decipher(_type: Integer; bufIn: AnsiString; bufInLen: Integer;
                     bufOut: AnsiString; bufOutLen: PInteger): Integer; cdecl;
{$ENDIF}
// License handlers
function aw_license_add: Integer; cdecl;
function aw_license_attributes(const name: AnsiString): Integer; cdecl;
function aw_license_attributesW(const name: WideString): Integer; cdecl;
function aw_license_change: Integer; cdecl;
function aw_license_delete(const name: AnsiString): Integer; cdecl;
function aw_license_deleteW(const name: WideString): Integer; cdecl;
function aw_license_next: Integer; cdecl;
function aw_license_previous: Integer; cdecl;
// Object handlers
function aw_object_add: Integer; cdecl;
function aw_object_add_session(session: Integer): Integer; cdecl;
function aw_object_change: Integer; cdecl;
function aw_object_delete: Integer; cdecl;
function aw_object_delete_session: Integer; cdecl;
function aw_object_load: Integer; cdecl;
function aw_object_query: Integer; cdecl;
function aw_object_click: Integer; cdecl;
function aw_object_select: Integer; cdecl;
function aw_delete_all_objects: Integer; cdecl;
function aw_object_bump: Integer; cdecl;
// Query handlers
function aw_query(x_sector, z_sector: Integer; sequence: TQueryArray): Integer; cdecl;
function aw_query_5x5(x_sector, z_sector: Integer; sequence: TQueryArrayBig): Integer; cdecl;
// Cell handlers
function aw_sector_from_cell(cell: Integer): Integer; cdecl;
function aw_cell_next: Integer; cdecl;
// Avatar handlers
function aw_avatar_click(session_id: Integer): Integer; cdecl;
function aw_avatar_set(session_id: Integer): Integer; cdecl;
function aw_avatar_reload(citizen, session_id: Integer): Integer; cdecl;
function aw_avatar_location(citizen, session_id: Integer; name: AnsiString): Integer; cdecl;
function aw_avatar_locationW(citizen, session_id: Integer; name: WideString): Integer; cdecl;
// User handlers
function aw_teleport(session_id: Integer): Integer; cdecl;
function aw_user_data_set(data: Pointer): Integer; cdecl;
function aw_user_data: Pointer; cdecl;
function aw_user_list: Integer; cdecl;
function aw_camera_set(session_id: Integer): Integer; cdecl;
// URL handlers
function aw_url_send(session_id: Integer; const url, target: AnsiString): Integer; cdecl;
function aw_url_sendW(session_id: Integer; const url, target: WideString): Integer; cdecl;
function aw_url_click(const url: AnsiString): Integer; cdecl;
function aw_url_clickW(const url: WideString): Integer; cdecl;
// Terrain handlers
function aw_terrain_set(x, z, count, texture: Integer; heights: PInteger): Integer; cdecl;
function aw_terrain_query(page_x, page_z: Integer; sequence: LongInt): Integer; cdecl;
function aw_terrain_next: Integer; cdecl;
function aw_terrain_delete_all: Integer; cdecl;
function aw_terrain_load_node: Integer; cdecl;
// Mover handlers
function aw_mover_set_state(id, state, model_num: Integer): Integer; cdecl;
function aw_mover_set_position(id, x, y, z, yaw, pitch, roll: Integer): Integer; cdecl;
function aw_mover_rider_add(id, session, dist, angle, y_delta, yaw_delta,
                            pitch_delta: Integer): Integer; cdecl;
function aw_mover_rider_change(id, session, dist, angle, y_delta, yaw_delta,
                               pitch_delta: Integer): Integer; cdecl;
function aw_mover_rider_delete(id, session: Integer): Integer; cdecl;
function aw_mover_links(id: Integer): Integer; cdecl;
// GUI handlers
function aw_hud_create: Integer; cdecl;
function aw_hud_click: Integer; cdecl;
function aw_hud_destroy(session, id: Integer): Integer; cdecl;
function aw_hud_clear(session: Integer): Integer; cdecl;
// Laser handlers
function aw_laser_beam: Integer; cdecl;
// World Admin handlers
function aw_server_admin(const domain: AnsiString; port: Integer;
                         const password: AnsiString; instance: PPointer): Integer; cdecl;
function aw_server_adminW(const domain: WideString; port: Integer;
                          const password: WideString; instance: PPointer): Integer; cdecl;
function aw_server_world_add: Integer; cdecl;
function aw_server_world_delete(id: Integer): Integer; cdecl;
function aw_server_world_change(id: Integer): Integer; cdecl;
function aw_server_world_list: Integer; cdecl;
function aw_server_world_start(id: Integer): Integer; cdecl;
function aw_server_world_stop(id: Integer): Integer; cdecl;
function aw_server_world_set(id: Integer): Integer; cdecl;
function aw_server_world_get: Integer; cdecl;
function aw_server_world_instance_set(id: Integer): Integer; cdecl;
function aw_server_world_instance_add(id, instance_id: Integer): Integer; cdecl;
function aw_server_world_instance_delete(id, instance_id: Integer): Integer; cdecl;
// Converters
function aw_int(a: AW_ATTRIBUTE): Integer; cdecl;
function aw_int_set(a: AW_ATTRIBUTE; value: Integer): Integer; cdecl;
function aw_string(a: AW_ATTRIBUTE): PAnsiChar; cdecl;
function aw_stringW(a: AW_ATTRIBUTE): PChar; cdecl;
function aw_string_set(a: AW_ATTRIBUTE; const value: AnsiString): Integer; cdecl;
function aw_string_setW(a: AW_ATTRIBUTE; const value: WideString): Integer; cdecl;
function aw_bool(a: AW_ATTRIBUTE): Boolean; cdecl;
function aw_bool_set(a: AW_ATTRIBUTE; value: Integer): Boolean; cdecl;
function aw_float(a: AW_ATTRIBUTE): Single; cdecl;
function aw_float_set(a: AW_ATTRIBUTE; value: Single): Integer; cdecl;
function aw_data(a: AW_ATTRIBUTE; length: PFixedUInt): PAnsiChar; cdecl;
function aw_data_set(a: AW_ATTRIBUTE; const value: AnsiString; length: FixedUInt): Integer; cdecl;
// Misc and Utils
function  aw_state_change: Integer; cdecl;
function  aw_wait(milliseconds: Integer): Integer; cdecl;
function  aw_world_list: Integer; cdecl;
function  aw_random: Integer; cdecl;
function  aw_session: Integer; cdecl;
function  aw_address: Integer; cdecl;
function  aw_toolbar_click: Integer; cdecl;
function  aw_noise(session_id: Integer): Integer; cdecl;
function  aw_botmenu_send: Integer; cdecl;
function  aw_tick: UInt64; cdecl;
function  aw_check_right(citizen: Integer; str: AnsiString): Integer; cdecl;
function  aw_check_rightW(citizen: Integer; str: WideString): Integer; cdecl;
function  aw_check_right_all(str: AnsiString): Integer; cdecl;
function  aw_check_right_allW(str: WideString): Integer; cdecl;
function  aw_has_world_right(citizen: Integer; right: AW_ATTRIBUTE): Integer; cdecl;
function  aw_has_world_right_all(right: AW_ATTRIBUTE): Integer; cdecl;
function  aw_traffic_count(traffic_in, traffic_out: PInteger): Integer; cdecl;
function  aw_zip(data_out: PByte; len_out: PFixedUInt;
                 data_in: PByte; len_in: FixedUInt): Integer; cdecl;
function  aw_unzip(data_out: PByte; len_out: PFixedUInt;
                   data_in: PByte; len_in: FixedUInt): Integer; cdecl;
function  aw_string_to_unicode(str: AnsiString): WideString; cdecl;
function  aw_string_from_unicode(str: WideString): AnsiString; cdecl;
procedure aw_string_set_MBCS_codepage(codepage: FixedUInt); cdecl;

{ object-type specific macro methods }
function aw_object_zone_set(size: aw_type_vector; shape: Byte; priority: AnsiChar; gravity, friction: Single;
                            flags: Word; color: LongInt; fog_min, fog_max: Word;
                            footstep, ambient, camera, target_cur, voip_rights, name: AnsiString): Integer; cdecl;
function aw_object_zone(len: PInteger): Paw_object_data_zone; cdecl;
function aw_object_particles_set(volume, speed, accel, angle, spin, size: aw_type_vector_range;
                                 release_min, release_max: LongInt; release_size: Word;
                                 lifespan, emitter_lifespan, fade_in, fade_out, color_start, color_end: LongInt;
                                 opacity: Single; render_style: Byte; flags: Word; style: Byte;
                                 asset_list, name: AnsiString): Integer; cdecl;
function aw_object_particles(len: PInteger): Paw_object_data_particles; cdecl;
function aw_object_cloth_set(_type, shape: Byte; flags: FixedUInt; anchor_type, anchor_pos: Byte;
                             anchor_offset, orientation, dimension: aw_type_vector;
                             resolution: Byte; opacity: Single; color: FixedUInt;
                             time_till_static, bending_stiffness, stretching_stiffness, compression_limit,
                             compression_stiffness, hard_stretch_limit, damping_coeff, collision_response,
                             tear_factor, attachment_response, attachment_tear_factor, density, thickness,
                             friction, pressure: Single;
                             wind, valid_bounds: aw_type_vector;
                             impulse_threshold, penetration_depth, max_deformation_distance: Single;
                             name, anchor, texture, model: AnsiString): Integer; cdecl;
function aw_object_cloth(len: PInteger): Paw_object_data_cloth; cdecl;
function aw_object_camera_set(flags: Word; zoom: Single; name: AnsiString): Integer; cdecl;
function aw_object_camera(len: PInteger): Paw_object_data_camera; cdecl;
function aw_object_mover_set(_type: Byte; flags: Word;
                             locked_pos_x, locked_pos_y, locked_pos_z, locked_yaw, locked_pitch: SmallInt;
                             glide_factor: AnsiChar; speed_factor, friction_factor: Byte;
                             accel_tilt_x, accel_tilt_z: AnsiChar; turn_factor, avatar_tag: Byte;
                             name, seq, script, sound: AnsiString;
                             waypoints_len: Word; waypoints: Pointer; bump_name: AnsiString): Integer; cdecl;
function aw_object_mover(len: PInteger): Paw_object_data_mover; cdecl;

{ methods below are not currently available in the SDK }
// Contacts
function aw_contact_add(citizen: Integer; options: FixedUInt): Integer; cdecl;
function aw_contact_add_by_name(name: AnsiString; options: FixedUInt): Integer; cdecl;
function aw_contact_add_by_nameW(name: WideString; options: FixedUInt): Integer; cdecl;
function aw_contact_change(citizen: Integer; options: FixedUInt): Integer; cdecl;
function aw_contact_confirm(citizen: Integer; options: FixedUInt): Integer; cdecl;
function aw_contact_delete(citizen: Integer): Integer; cdecl;
function aw_contact_list(start: Integer): Integer; cdecl;
// AFK
function aw_afk_set(flag: Integer): Integer; cdecl;
// Telegram
function aw_telegram_send(_to, msg: AnsiString): Integer; cdecl;
function aw_telegram_sendW(_to, msg: WideString): Integer; cdecl;
// Join
function aw_join(citizen: Integer): Integer; cdecl;
function aw_join_reply(citizen, reply_rc: Integer): Integer; cdecl;
// Forgot password
function aw_password_send: Integer; cdecl;
// Register
function aw_immigrate: Integer; cdecl;
function aw_register(renewal: Integer): Integer; cdecl;
// File transfer
function aw_send_file: Integer; cdecl;
function aw_send_file_reply(reply_rc: Integer): Integer; cdecl;
// Login timeout
procedure aw_login_timeout_set(timeout: Integer); cdecl;
// Proxy
function aw_tunnel_set(const domain: AnsiString; port: Word): Integer; cdecl;
function aw_tunnel_setW(const domain: WideString; port: Word): Integer; cdecl;
function aw_tunnel_set_resolved(address: LongInt; port: Word): Integer; cdecl;
function aw_proxy_set(const domain: AnsiString; port: Word): Integer; cdecl;
function aw_proxy_setW(const domain: WideString; port: Word): Integer; cdecl;
function aw_proxy_set_resolved(address: LongInt; port: Word): Integer; cdecl;
function aw_proxy_set_login(const name, password: AnsiString): Integer; cdecl;
function aw_proxy_set_loginW(const name, password: WideString): Integer; cdecl;
// Communications
function aw_connection: Integer; cdecl;
function aw_connection_set(_type: Integer): Integer; cdecl;
function aw_connection_state(instance: Pointer): Integer; cdecl;
// VOIP
function aw_voip_data(data: Pointer; len: FixedUInt): Integer; cdecl;
function aw_voip_group_set(group: Integer; rights: AnsiString): Integer; cdecl;
function aw_voip_group_setW(group: Integer; rights: WideString): Integer; cdecl;
function aw_voipcast_set(const domain: AnsiString; port: Word): Integer; cdecl;
function aw_voipcast_setW(const domain: WideString; port: Word): Integer; cdecl;
function aw_voipcast_set_resolved(address: LongInt; port: Word): Integer; cdecl;
function aw_voipcast_ready: Integer; cdecl;
// Debug
function aw_debug_callback_set(callback: TDebugCallback): Integer; cdecl;
// XFer
function aw_xfer_offer: Integer; cdecl;
function aw_xfer_reply: Integer; cdecl;
function aw_xfer_send: Integer; cdecl;
function aw_xfer_request: Integer; cdecl;
function aw_xfer_request_show(const showName: AnsiString; ShowSequence: Integer;
                              const WorldName, ZoneName, TagName: AnsiString): Integer; cdecl;
function aw_xfer_request_showW(const ShowName: WideString; ShowSequence: Integer;
                               const WorldName, ZoneName, TagName: WideString): Integer; cdecl;
function aw_xfer_cancel: Integer; cdecl;
function aw_xfer_query: Integer; cdecl;

{ Custom methods }
// Error code to string
function aw_GetErrorText(errNum: Integer): AnsiString;
function aw_GetFullErrorText(errNum: Integer): AnsiString;

implementation

// Initializers and destroyers
function  aw_sdk_build;       external libName;
function  aw_init;            external libName;
function  aw_init_bind;       external libName;
procedure aw_term;            external libName;
function  aw_create;          external libName;
function  aw_createW;         external libName;
function  aw_create_resolved; external libName;
function  aw_destroy;         external libName;
// Login
function aw_login; external libName;
// Instance handlers
function aw_instance;              external libName;
function aw_instance_set;          external libName;
function aw_instance_wait;         external libName;
function aw_instance_callback_set; external libName;
function aw_instance_event_set;    external libName;
// Event handlers
procedure aw_event;     external libName;
function  aw_event_set; external libName;
// Callbacks
function aw_callback;     external libName;
function aw_callback_set; external libName;
// World handlers
function aw_enter;                   external libName;
function aw_enterW;                  external libName;
function aw_exit;                    external libName;
function aw_world_attributes_change; external libName;
function aw_world_eject;             external libName;
function aw_world_ejection_add;      external libName;
function aw_world_ejection_delete;   external libName;
function aw_world_ejection_lookup;   external libName;
function aw_world_ejection_next;     external libName;
function aw_world_ejection_previous; external libName;
function aw_world_attribute_set;     external libName;
function aw_world_attribute_setW;    external libName;
function aw_world_attribute_get;     external libName;
function aw_world_attribute_getW;    external libName;
function aw_world_reload_registry;   external libName;
function aw_world_attributes_reset;  external libName;
function aw_world_instance_set;      external libName;
function aw_world_instance_get;      external libName;
function aw_world_attributes_send;   external libName;
// Universe handlers
function aw_universe_attributes_change; external libName;
function aw_universe_ejection_add;      external libName;
function aw_universe_ejection_delete;   external libName;
function aw_universe_ejection_lookup;   external libName;
function aw_universe_ejection_next;     external libName;
function aw_universe_ejection_previous; external libName;
// Chat handlers
function aw_listen;          external libName;
function aw_say_channel;     external libName;
function aw_say_channelW;    external libName;
function aw_say;             external libName;
function aw_sayW;            external libName;
function aw_whisper;         external libName;
function aw_whisperW;        external libName;
function aw_console_message; external libName;
function aw_botgram_send;    external libName;
// Citizen handlers
function aw_citizen_attributes_by_name;   external libName;
function aw_citizen_attributes_by_nameW;  external libName;
function aw_citizen_attributes_by_number; external libName;
function aw_citizen_add;                  external libName;
function aw_citizen_change;               external libName;
function aw_citizen_delete;               external libName;
function aw_citizen_next;                 external libName;
function aw_citizen_previous;             external libName;
// CAV handlers
function aw_cav_request;          external libName;
function aw_cav_change;           external libName;
function aw_cav_delete;           external libName;
function aw_world_cav_request;    external libName;
function aw_world_cav_change;     external libName;
function aw_world_cav_delete;     external libName;
{$IF Defined(AW_BROWSER) or Defined(AW_STATIC)}
function aw_cav_template_request; external libName;
function aw_cav_template_get;     external libName;
// Shop handlers
function aw_shopitem_query;    external libName;
function aw_shopitem_by_id;    external libName;
function aw_shopitem_by_desc;  external libName;
function aw_shopitem_by_descW; external libName;
function aw_shopitem_add;      external libName;
function aw_shopitem_change;   external libName;
function aw_shopitem_next;     external libName;
function aw_shopitem_previous; external libName;
function aw_shoptrans_total;   external libName;
function aw_shoptrans_buy;     external libName;
function aw_shoptrans_add;     external libName;
function aw_shoptrans_list;    external libName;
// Crypto
function aw_decipher; external libName;
{$ENDIF}
// License handlers
function aw_license_add;         external libName;
function aw_license_attributes;  external libName;
function aw_license_attributesW; external libName;
function aw_license_change;      external libName;
function aw_license_delete;      external libName;
function aw_license_deleteW;     external libName;
function aw_license_next;        external libName;
function aw_license_previous;    external libName;
// Object handlers
function aw_object_add;            external libName;
function aw_object_add_session;    external libName;
function aw_object_change;         external libName;
function aw_object_delete;         external libName;
function aw_object_delete_session; external libName;
function aw_object_load;           external libName;
function aw_object_query;          external libName;
function aw_object_click;          external libName;
function aw_object_select;         external libName;
function aw_delete_all_objects;    external libName;
function aw_object_bump;           external libName;
// Query handlers
function aw_query;     external libName;
function aw_query_5x5; external libName;
// Cell handlers
function aw_sector_from_cell; external libName;
function aw_cell_next;        external libName;
// Avatar handlers
function aw_avatar_click;     external libName;
function aw_avatar_set;       external libName;
function aw_avatar_reload;    external libName;
function aw_avatar_location;  external libName;
function aw_avatar_locationW; external libName;
// User handlers
function aw_teleport;      external libName;
function aw_user_data_set; external libName;
function aw_user_data;     external libName;
function aw_user_list;     external libName;
function aw_camera_set;    external libName;
// URL handlers
function aw_url_send;   external libName;
function aw_url_sendW;  external libName;
function aw_url_click;  external libName;
function aw_url_clickW; external libName;
// Terrain handlers
function aw_terrain_set;        external libName;
function aw_terrain_query;      external libName;
function aw_terrain_next;       external libName;
function aw_terrain_delete_all; external libName;
function aw_terrain_load_node;  external libName;
// Mover handlers
function aw_mover_set_state;    external libName;
function aw_mover_set_position; external libName;
function aw_mover_rider_add;    external libName;
function aw_mover_rider_change; external libName;
function aw_mover_rider_delete; external libName;
function aw_mover_links;        external libName;
// GUI handlers
function aw_hud_create;  external libName;
function aw_hud_click;   external libName;
function aw_hud_destroy; external libName;
function aw_hud_clear;   external libName;
// Laser handlers
function aw_laser_beam; external libName;
// World Admin handlers
function aw_server_admin;                 external libName;
function aw_server_adminW;                external libName;
function aw_server_world_add;             external libName;
function aw_server_world_delete;          external libName;
function aw_server_world_change;          external libName;
function aw_server_world_list;            external libName;
function aw_server_world_start;           external libName;
function aw_server_world_stop;            external libName;
function aw_server_world_set;             external libName;
function aw_server_world_get;             external libName;
function aw_server_world_instance_set;    external libName;
function aw_server_world_instance_add;    external libName;
function aw_server_world_instance_delete; external libName;
// Converters
function aw_int;         external libName;
function aw_int_set;     external libName;
function aw_string;      external libName;
function aw_stringW;     external libName;
function aw_string_set;  external libName;
function aw_string_setW; external libName;
function aw_bool;        external libName;
function aw_bool_set;    external libName;
function aw_float;       external libName;
function aw_float_set;   external libName;
function aw_data;        external libName;
function aw_data_set;    external libName;
// Misc and Utils
function  aw_state_change;             external libName;
function  aw_wait;                     external libName;
function  aw_world_list;               external libName;
function  aw_random;                   external libName;
function  aw_session;                  external libName;
function  aw_address;                  external libName;
function  aw_toolbar_click;            external libName;
function  aw_noise;                    external libName;
function  aw_botmenu_send;             external libName;
function  aw_tick;                     external libName;
function  aw_check_right;              external libName;
function  aw_check_rightW;             external libName;
function  aw_check_right_all;          external libName;
function  aw_check_right_allW;         external libName;
function  aw_has_world_right;          external libName;
function  aw_has_world_right_all;      external libName;
function  aw_traffic_count;            external libName;
function  aw_zip;                      external libName;
function  aw_unzip;                    external libName;
function  aw_string_to_unicode;        external libName;
function  aw_string_from_unicode;      external libName;
procedure aw_string_set_MBCS_codepage; external libName;

{ object-type specific macro methods }
function aw_object_zone_set;      external libName;
function aw_object_zone;          external libName;
function aw_object_particles_set; external libName;
function aw_object_particles;     external libName;
function aw_object_cloth_set;     external libName;
function aw_object_cloth;         external libName;
function aw_object_camera_set;    external libName;
function aw_object_camera;        external libName;
function aw_object_mover_set;     external libName;
function aw_object_mover;         external libName;

{ methods below are not currently available in the SDK }
// Contacts
function aw_contact_add;          external libName;
function aw_contact_add_by_name;  external libName;
function aw_contact_add_by_nameW; external libName;
function aw_contact_change;       external libName;
function aw_contact_confirm;      external libName;
function aw_contact_delete;       external libName;
function aw_contact_list;         external libName;
// AFK
function aw_afk_set; external libName;
// Telegram
function aw_telegram_send;  external libName;
function aw_telegram_sendW; external libName;
// Join
function aw_join;       external libName;
function aw_join_reply; external libName;
// Forgot password
function aw_password_send; external libName;
// Register
function aw_immigrate; external libName;
function aw_register;  external libName;
// File transfer
function aw_send_file;       external libName;
function aw_send_file_reply; external libName;
// Login timeout
procedure aw_login_timeout_set; external libName;
// Proxy
function aw_tunnel_set;          external libName;
function aw_tunnel_setW;         external libName;
function aw_tunnel_set_resolved; external libName;
function aw_proxy_set;           external libName;
function aw_proxy_setW;          external libName;
function aw_proxy_set_resolved;  external libName;
function aw_proxy_set_login;     external libName;
function aw_proxy_set_loginW;    external libName;
// Communications
function aw_connection;       external libName;
function aw_connection_set;   external libName;
function aw_connection_state; external libName;
// VOIP
function aw_voip_data;             external libName;
function aw_voip_group_set;        external libName;
function aw_voip_group_setW;       external libName;
function aw_voipcast_set;          external libName;
function aw_voipcast_setW;         external libName;
function aw_voipcast_set_resolved; external libName;
function aw_voipcast_ready;        external libName;
// Debug
function aw_debug_callback_set; external libName;
// XFer
function aw_xfer_offer;         external libName;
function aw_xfer_reply;         external libName;
function aw_xfer_send;          external libName;
function aw_xfer_request;       external libName;
function aw_xfer_request_show;  external libName;
function aw_xfer_request_showW; external libName;
function aw_xfer_cancel;        external libName;
function aw_xfer_query;         external libName;

{ Custom methods }
// Error code to string
function aw_GetErrorText(errNum: Integer): AnsiString;
begin
	case errNum of
		// RC_SUCCESS
		0: result := 'Success';
		// RC_CITIZENSHIP_EXPIRED
		1: result := 'Citizenship has expired';
		// RC_LAND_LIMIT_EXCEEDED
		2: result := 'Land limit exceeded';
		// RC_NO_SUCH_CITIZEN
		3: result := 'No such citizen';
		// RC_LICENSE_PASSWORD_CONTAINS_SPACE
		5: result := 'License password contains space';
		// RC_LICENSE_PASSWORD_TOO_LONG
		6: result := 'License password too long';
		// RC_LICENSE_PASSWORD_TOO_SHORT
		7: result := 'License password too short';
		// RC_LICENSE_RANGE_TOO_LARGE
		8: result := 'License range too large';
		// RC_LICENSE_RANGE_TOO_SMALL
		9: result := 'License range too small';
		// RC_LICENSE_USERS_TOO_LARGE
		10: result := 'License users too large';
		// RC_LICENSE_USERS_TOO_SMALL
		11: result := 'License users too small';
		// RC_INVALID_PASSWORD
		13: result := 'Invalid password';
		// RC_LICENSE_WORLD_TOO_SHORT
		15: result := 'License world too short';
		// RC_LICENSE_WORLD_TOO_LONG
		16:	result := 'License world too long';
		// RC_INVALID_WORLD
		20:	result := 'Invalid world';
		// RC_SERVER_OUTDATED
		21:	result := 'Server outdated';
		// RC_WORLD_ALREADY_STARTED
		22:	result := 'World already started';
		// RC_NO_SUCH_WORLD
		27:	result := 'No such world';
		// RC_UNAUTHORIZED
		32:	result := 'Unauthorized';
		// RC_NO_SUCH_LICENSE
		34:	result := 'No such license';
		// RC_TOO_MANY_WORLDS
		57:	result := 'Too many worlds';
		// RC_MUST_UPGRADE
		58:	result := 'Must upgrade';
		// RC_BOT_LIMIT_EXCEEDED
		59:	result := 'Bot limit exceeded';
		// RC_WORLD_EXPIRED
		61:	result := 'World expired';
		// RC_CITIZEN_DOES_NOT_EXPIRE
		62:	result := 'Citizen does not expire'; //TODO: What is this used for ?
		// RC_LICENSE_STARTS_WITH_NUMBER
		64:	result := 'License starts with number';
		// RC_NO_SUCH_EJECTION
		66:	result := 'No such ejection';
		// RC_NO_SUCH_SESSION
		67:	result := 'No such session';
		// RC_WORLD_RUNNING
		72:	result := 'World running';
		// RC_WORLD_NOT_SET
		73:	result := 'World not set';
		// RC_NO_SUCH_CELL
		74:	result := 'No such cell';
		// RC_NO_REGISTRY
		75: result := 'No registry';
		// RC_CANT_OPEN_REGISTRY
		76:	result := 'Can''t open registry';
		// RC_CITIZEN_DISABLED
		77:	result := 'Citizen disabled';
		// RC_WORLD_DISABLED
		78: result := 'World disabled';
		// RC_TELEGRAM_BLOCKED
		85:	result := 'Telegram blocked';
		// RC_UNABLE_TO_UPDATE_TERRAIN
		88:	result := 'Unable to update terrain';
		// RC_EMAIL_CONTAINS_INVALID_CHAR
		100: result := 'Email contains invalid char';
		// RC_EMAIL_ENDS_WITH_BLANK
		101: result := 'Email ends with blank';
		{ // Double definition....?
		// RC_NO_SUCH_OBJECT
		101: result := 'No such object';
    }
		// RC_EMAIL_MISSING_DOT
		102: result := 'Email missing dot';
		{ // Double definition....?
		// RC_NOT_DELETE_OWNER
		102: result := 'Not delete owner';
    }
		// RC_EMAIL_MISSING_AT
		103: result := 'Email missing at';
		// RC_EMAIL_STARTS_WITH_BLANK
		104: result := 'Email starts with blank';
		// RC_EMAIL_TOO_LONG
		105: result := 'Email too long';
		// RC_EMAIL_TOO_SHORT
		106: result := 'Email too short';
		// RC_NAME_ALREADY_USED
		107: result := 'Name already used';
		// RC_NAME_CONTAINS_NONALPHANUMERIC_CHAR
		108: result := 'Name contains nonalphanumeric character';
		// RC_NAME_CONTAINS_INVALID_BLANK
		109: result := 'Name contains invalid blank';
		// RC_NAME_ENDS_WITH_BLANK
		111: result := 'Name ends with blank';
		// RC_NAME_TOO_LONG
		112: result := 'Name too long';
		// RC_NAME_TOO_SHORT
		113: result := 'Name too short';
		// RC_PASSWORD_TOO_LONG
		115: result := 'Password too long';
		// RC_PASSWORD_TOO_SHORT
		116: result := 'Password too short';
		// RC_UNABLE_TO_DELETE_CITIZEN
		124: result := 'Unable to delete citizen';
		// RC_NUMBER_ALREADY_USED
		126: result := 'Number already used';
		// RC_NUMBER_OUT_OF_RANGE
		127: result := 'Number out of range';
		// RC_PRIVILEGE_PASSWORD_IS_TOO_SHORT
		128: result := 'Privilege password is too short';
		// RC_PRIVILEGE_PASSWORD_IS_TOO_LONG
		129: result := 'Privilege password is too long';
		// RC_NOT_CHANGE_OWNER
		203: result := 'Not change owner';
		// RC_CANT_FIND_OLD_ELEMENT
		204: result := 'Can''t find old element';
		// RC_IMPOSTER
		212: result := 'Imposter';
		// RC_ENCROACHES
		300: result := 'Encroaches';
		// RC_OBJECT_TYPE_INVALID
		301: result := 'Object type invalid';
		// RC_TOO_MANY_BYTES
		303: result := 'Too many bytes';
		// RC_UNREGISTERED_OBJECT
		306: result := 'Unregistered object';
		// RC_ELEMENT_ALREADY_EXISTS
		308: result := 'Element already exists';
		// RC_RESTRICTED_COMMAND
		309: result := 'Restricted command';
		// RC_OUT_OF_BOUNDS
		311: result := 'Out of bounds';
		// RC_RESTRICTED_OBJECT
		313: result := 'Restricted object';
		// RC_RESTRICTED_AREA
		314: result := 'Restricted area';
		// RC_NOT_YET
		401: result := 'Not yet';
		// RC_TIMEOUT
		402: result := 'Timeout';
		// RC_UNABLE_TO_CONTACT_UNIVERSE
		404: result := 'Unable to contact universe';
		// RC_NO_CONNECTION
		439: result := 'No connection';
		// RC_NOT_INITIALIZED
		444: result := 'Not initialized';
		// RC_NO_INSTANCE
		445: result := 'No instance';
		// RC_INVALID_ATTRIBUTE
		448: result := 'Invalid attribute';
		// RC_TYPE_MISMATCH
		449: result := 'Type mismatch';
		// RC_STRING_TOO_LONG
		450: result := 'String too long';
		// RC_READ_ONLY
		451: result := 'Read only';
		// RC_INVALID_INSTANCE
		453: result := 'Invalid instance';
		// RC_VERSION_MISMATCH
		454: result := 'Version mismatch';
		// RC_QUERY_IN_PROGRESS
		464: result := 'Query in progress';
		// RC_EJECTED
		466: result := 'Ejected';
		// RC_NOT_WELCOME
		467: result := 'Not welcome';
		// RC_CONNECTION_LOST
		471: result := 'Connection lost';
		// RC_NOT_AVAILABLE
		474: result := 'Not available';
		// RC_CANT_RESOLVE_UNIVERSE_HOST
		500: result := 'Can''t resolve universe host';
		// RC_INVALID_ARGUMENT
		505: result := 'Invalid argument';
		// RC_UNABLE_TO_UPDATE_CAV
		514: result := 'Unable to update custom avatar';
		// RC_UNABLE_TO_DELETE_CAV
		515: result := 'Unable to delete custom avatar';
		// RC_NO_SUCH_CAV
		516: result := 'No such custom avatar';
		// RC_WORLD_INSTANCE_ALREADY_EXISTS
		521: result := 'World instance already exists';
		// RC_WORLD_INSTANCE_INVALID
		522: result := 'World instance invalid';
		// RC_PLUGIN_NOT_AVAILABLE
		523: result := 'Plugin not available';
		// RC_DATABASE_ERROR
		600: result := 'Database error';
		// RC_Z_BUF_ERROR
		4995: result := 'Buffer error(zlib)';
		// RC_Z_MEM_ERROR
		4996: result := 'Memory error(zlib)';
		// RC_Z_DATA_ERROR
		4997: result := 'Data error(zlib)';
    // UNKNOWN
		else result := 'Unknown error';
  end;
end;

function aw_GetFullErrorText(errNum: Integer): AnsiString;
begin
	case errNum of
		// RC_SUCCESS
		0: result := 'Operation has completed successfully.';
		// RC_CITIZENSHIP_EXPIRED
		1: result := 'Citizenship of the owner has expired.';
		// RC_LAND_LIMIT_EXCEEDED
		2: result := 'Land limit of the universe would be exceeded if the world is started.';
		// RC_NO_SUCH_CITIZEN
		3: result := 'No citizenship with a matching citizen number was found.';
		// RC_LICENSE_PASSWORD_CONTAINS_SPACE
		5: result := 'Password cannot contain a space.';
		// RC_LICENSE_PASSWORD_TOO_LONG
		6: result := 'Password cannot be longer than 8 characters.';
		// RC_LICENSE_PASSWORD_TOO_SHORT
		7: result := 'Password must be at least 2 characters.';
		// RC_LICENSE_RANGE_TOO_LARGE
		8: result := 'Range must be smaller than 3275 hectometers.' + sLineBreak +
                 'That is, at most 32750 coordinates [N / S / W / E] or 655000 meters across.';
		// RC_LICENSE_RANGE_TOO_SMALL
		9: result := 'Range must be larger than 0 hectometers.' + sLineBreak +
                 'That is, at least 10 coordinates [N / S / W / E] or 200 meters across.';
		// RC_LICENSE_USERS_TOO_LARGE
		10: result := 'User limit cannot exceed 1024.';
		// RC_LICENSE_USERS_TOO_SMALL
		11: result := 'User limit must be larger than 0.';
		// RC_INVALID_PASSWORD
		13: result := 'Unable to login due to invalid password.';
		// RC_LICENSE_WORLD_TOO_SHORT
		15: result := 'Name must be at least 2 characters.';
		// RC_LICENSE_WORLD_TOO_LONG
		16:	result := 'Name cannot be longer than 8 characters.';
		// RC_INVALID_WORLD
		20:	result := 'Unable to start the world due to invalid name or password.';
		// RC_SERVER_OUTDATED
		21:	result := 'Server build either contains a serious flaw or is outdated and must be upgraded.';
		// RC_WORLD_ALREADY_STARTED
		22:	result := 'World has already been started at a different location.';
		// RC_NO_SUCH_WORLD
		27:	result := 'No world with a matching name has been started on the server.';
		// RC_UNAUTHORIZED
		32:	result := 'Not authorized to perform the operation.';
		// RC_NO_SUCH_LICENSE
		34:	result := 'No license with a matching world name was found.';
		// RC_TOO_MANY_WORLDS
		57:	result := 'Limit of started worlds in the universe would be exceeded if the world is started.';
		// RC_MUST_UPGRADE
		58:	result := 'SDK build either contains a serious flaw or is outdated and must be upgraded.';
		// RC_BOT_LIMIT_EXCEEDED
		59:	result := 'Bot limit of the owner citizenship would be exceeded if the bot is logged in.';
		// RC_WORLD_EXPIRED
		61:	result := 'Unable to start world due to its license having expired.';
		// RC_LICENSE_STARTS_WITH_NUMBER
		64:	result := 'Name cannot start with a number.';
		// RC_NO_SUCH_EJECTION
		66:	result := 'No ejection with a matching identifier was found.';
		// RC_NO_SUCH_SESSION
		67:	result := 'No user with a matching session number has entered the world.';
		// RC_WORLD_RUNNING
		72:	result := '"World has already been started.';
		// RC_WORLD_NOT_SET
		73:	result := 'World to perform the operation on has not been set.';
		// RC_NO_SUCH_CELL
		74:	result := 'No more cells left to enumerate.';
		// RC_NO_REGISTRY
		75: result := 'Unable to start world due to missing or invalid registry.';
		// RC_CANT_OPEN_REGISTRY
		76:	result := 'Unable to open the registry.';
		// RC_CITIZEN_DISABLED
		77:	result := 'Citizenship of the owner has been disabled.';
		// RC_WORLD_DISABLED
		78: result := 'Unable to start world due to it being disabled.';
		// RC_TELEGRAM_BLOCKED
		85:	result := 'Telegrams have been blocked for this user.';
		// RC_EMAIL_CONTAINS_INVALID_CHAR
		100: result := 'Email address contains one or more invalid characters.';
		// RC_EMAIL_ENDS_WITH_BLANK
		101: result := 'Email address cannot end with a blank.';
		{ // Double definition....?
		// RC_NO_SUCH_OBJECT
		101: result := 'Unable to find the object to delete.';
    }
		// RC_EMAIL_MISSING_DOT
		102: result := 'Email address must contain at least one ".".';
		{ // Double definition....?
		// RC_NOT_DELETE_OWNER
		102: result := 'The owner can not be deleted.';
    }
		// RC_EMAIL_MISSING_AT
		103: result := 'Email address must contain a "@".';
		// RC_EMAIL_STARTS_WITH_BLANK
		104: result := 'Email address cannot start with a blank.';
		// RC_EMAIL_TOO_LONG
		105: result := 'Email address cannot be longer than 50 characters.';
		// RC_EMAIL_TOO_SHORT
		106: result := 'Email address must be at least 8 characters or longer.';
		// RC_NAME_ALREADY_USED
		107: result := 'Citizenship with a matching name already exists.';
		// RC_NAME_CONTAINS_NONALPHANUMERIC_CHAR
		108: result := 'Name contains invalid character(s) and therefor it cannot be used.';
		// RC_NAME_CONTAINS_INVALID_BLANK
		109: result := 'Name contains invalid blank(s) and therefor it cannot be used.';
		// RC_NAME_ENDS_WITH_BLANK
		111: result := 'Name cannot end with a blank.';
		// RC_NAME_TOO_LONG
		112: result := 'Name cannot be longer than 20 characters.';
		// RC_NAME_TOO_SHORT
		113: result := 'Name must be at least 4 characters.';
		// RC_PASSWORD_TOO_LONG
		115: result := 'Password cannot be longer than 16 characters.';
		// RC_PASSWORD_TOO_SHORT
		116: result := 'Password must be at least 8 characters.';
		// RC_UNABLE_TO_DELETE_CITIZEN
		124: result := 'Unable to delete citizen due to a database problem.';
		// RC_NUMBER_ALREADY_USED
		126: result := 'Citizenship with a matching citizen number already exists.';
		// RC_NUMBER_OUT_OF_RANGE
		127: result := 'Citizen number is larger than the auto-incremented field in the database.';
		// RC_PRIVILEGE_PASSWORD_IS_TOO_SHORT
		128: result := 'Privilege password must be either empty or at least 4 characters.';
		// RC_PRIVILEGE_PASSWORD_IS_TOO_LONG
		129: result := 'Password cannot be longer than 12 characters.';
		// RC_NOT_CHANGE_OWNER
		203: result := 'Not permitted to change the owner of an object.' + sLineBreak +
                   'It requires eminent domain or caretaker capability.';
		// RC_CANT_FIND_OLD_ELEMENT
		204: result := 'Unable to find the object to change.';
		// RC_IMPOSTER
		212: result := 'Unable to enter world due to masquerading as someone else.';
		// RC_ENCROACHES
		300: result := 'Not allowed to encroach into another''s property.';
		// RC_TOO_MANY_BYTES
		303: result := 'Cell limit has been exceeded.';
		// RC_UNREGISTERED_OBJECT
		306: result := 'Model name does not exist in the registry.';
		// RC_RESTRICTED_COMMAND
		309: result := 'Unable to execute this command due to world or universe restrictions.';
		// RC_RESTRICTED_OBJECT
		313: result := 'Not allowed to build with "z" objects in this world.';
		// RC_RESTRICTED_AREA
		314: result := 'Not allowed to build within the restricted area of this world.';
		// RC_NOT_YET
		401: result := 'Exceeded the maximum number of operations per second.';
		// RC_TIMEOUT
		402: result := 'Synchronous operation timed out.';
		// RC_UNABLE_TO_CONTACT_UNIVERSE
		404: result := 'Unable to establish a connection to the universe server.';
		// RC_NO_CONNECTION
		439: result := 'Connection to the server is down.';
		// RC_NOT_INITIALIZED
		444: result := 'SDK API has not been initialized (by calling aw_init).';
		// RC_NO_INSTANCE
		445: result := 'No such instance exists.';
		// RC_STRING_TOO_LONG
		450: result := 'The string exceeds it''s allowed limmits.';
		// RC_READ_ONLY
		451: result := 'Unable to set attribute due to it being read-only.';
		// RC_INVALID_INSTANCE
		453: result := 'The specified instance is incorrect.';
		// RC_VERSION_MISMATCH
		454: result := 'AwPas.pas is made for a different build of the SDK.';
		// RC_QUERY_IN_PROGRESS
		464: result := 'A property query is already in progress.';
		// RC_EJECTED
		466: result := 'Disconnected from world due to ejection.';
		// RC_NOT_WELCOME
		467: result := 'Citizenship of the owner does not have bot rights in the world.';
		// RC_CANT_RESOLVE_UNIVERSE_HOST
		500: result := 'Unable to resolve the hostname of the universe.';
		// RC_Z_BUF_ERROR
		4995: result := '(ZLib) Not enough room in the output buffer.';
		// RC_Z_MEM_ERROR
		4996: result := '(ZLib) Memory could not be allocated for processing.';
		// RC_Z_DATA_ERROR
		4997: result := '(ZLib) Input data was corrupted.';
    // UNKNOWN
		else result := ' ';
  end;
end;

end.

