package ohmygift.common;



final public class Column{
	
	//for Gift Table
	public final static String GIFT_ID = "gift.id";
	public final static String GIFT_NAME = "gift.name";
	public final static String GIFT_TYPE = "gift.type";
	public final static String GIFT_PRICE = "gift.price";
	public final static String GIFT_CONTENT = "gift.content";
	public final static String GIFT_IMG = "gift.img";
	
	
	//for Member Table
	public final static String MEMBER_ID = "member.id";
	public final static String MEMBER_FACEBOOK_ID ="member.facebook_id";
	public final static String MEMBER_NAME= "member.name";
	public final static String MEMBER_BIRTHDAY = "member.birthday";
	public final static String MEMBER_IMAGE = "member.image";
	public final static String MEMBER_DATE = "member.date";
	
	
	//for RollingPaper Table
	public final static String ROLL_ID = "rollingpaper.id";
	public final static String ROLL_ME_MEMBER_ID = "rollingpaper.me_member_id";
	public final static String ROLL_FRIEND_MEMBER_ID = "rollingpaper.friend_member_id";
	public final static String ROLL_GIFT_NAME = "rollingpaper.gift_name";
	public final static String ROLL_GIFT_LINK = "rollingpaper.gift_link";
	public final static String ROLL_GIFT_PRICE = "rollingpaper.gift_price";
	public final static String ROLL_GIFT_IMAGE = "rollingpaper.gift_image";
	public final static String ROLL_GIFT_TYPE = "rollingpaper.gift_type";
	public final static String ROLL_GIFT_DATE = "rollingpaper.gift_date";
	
	//for Paylog Table
	public final static String PAYLOG_ID ="paylog.id";
	public final static String PAYLOG_MEMBER_ID = "paylog.member_id";
	public final static String PAYLOG_PRICE = "paylog.price";
	public final static String PAYLOG_PAPER_ID	="paylog.paper_id";
	public final static String PAYLOG_DATE = "paylog.date";
	
	//for Message Table
	public final static String MESSAGELOG_ID = "messagelog.id";
	public final static String MESSAGELOG_MEMBER_ID = "messagelog.member_id";
	public final static String MESSAGELOG_PAPER_ID ="messagelog.paper_id";
	public final static String MESSAGELOG_MESSAGE ="messagelog.message";
	public final static String MESSAGELOG_DATE ="messagelog.date";
	public final static String MESSAGELOG_PHOTO_URL="messagelog.photo_url";
	
	
}

