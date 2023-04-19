using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Runtime;
using System.Threading.Tasks;

namespace LYFC_CHONGDIANZHUANG.Models
{
    [Table("ad_info")]
    public partial class AdInfo
    {
        [Key]
        [Column("ad_id")]
        // 广告信息表ID
        public int Id { get; set; }
        [Column("status_id")]
        // 设备运行状态id
        public int? StatusId { get; set; }
        [Column("ad_pri")]
        // 广告优先级，0为最高，5为最低，默认为0
        public int AdPriority { get; set; }
        [Column("ad_file")]
        // 广告图片
        public string AdFileName { get; set; }
        [Column("ad_path")]
        // 广告图片的地址
        public string AdFilePath { get; set; }
        [Column("ad_url")]
        // 广告图片的url地址
        public string AdUrl { get; set; }
        [Column("update_tme", TypeName = "timestamp")]
        // 更新时间
        public DateTime? UpdateTime { get; set; }
        [Column("create_time", TypeName = "timestamp")]
        // 创建时间
        public DateTime? CreateTime { get; set; }
        // 定义外键关联
        [ForeignKey("StatusId")]
        [InverseProperty("AdvertisingInfos")]
        public virtual DeviceStatus Status { get; set; }
    }
    // carrier_info表对应的数据模型
    [Table("carrier_info")]
    public partial class CarrierInfo
    {
        [Key]
        [Column("carrier_id")]
        // 运营商信息表id
        public int Id { get; set; }
        [Required]
        [Column("carrier_name", TypeName = "varchar(50)")]
        // 运营商名称
        public string Name { get; set; }
        [Column("create_time", TypeName = "timestamp")]
        // 创建时间
        public DateTime CreateTime { get; set; }
    }
    // city表对应的数据模型
    [Table("city")]
    public partial class City
    {
        [Key]
        [Column("city_id")]
        // 城市表ID
        public int Id { get; set; }
        [Column("pro_id")]
        // 省份表id
        public int ProvinceId { get; set; }
        [Required]
        [Column("city_name", TypeName = "varchar(255)")]
        // 城市名
        public string Name { get; set; }
        // 建立Province与City表之间的1-to-many关系
        [ForeignKey("Province")]
        [Column("pro_id")]
        public virtual Province Province { get; set; }
    }
    [Table("device_event")]
    public partial class DeviceEvent
    {
        [Key]
        [Column("event_id")]
        // 设备事件记录id
        public int Id { get; set; }
        [Column("status_id")]
        // 设备运行状态表id
        public int StatusId { get; set; }
        [Column("is_online")]
        // 事件记录，0上次在线、1上次离线、2上次异常
        public int? IsOnline { get; set; }
        [Column("create_time")]
        // 创建时间
        public DateTime CreateTime { get; set; }
        // 建立Status与DeviceEvent表之间的1-to-many关系
        [ForeignKey("StatusId")]
        [Column("status_id")]
        public virtual DeviceStatus Status { get; set; }
    }
    [Table("device_info")]
    public partial class DeviceInfo
    {
        [Key]
        [Column("device_id")]
        // 设备id
        public int Id { get; set; }
        [Required]
        [Column("mode", TypeName = "varchar(15)")]
        // 设备型号
        public string Mode { get; set; }
        [Column("slot_count")]
        // 端口数量
        public int SlotCount { get; set; }
        [Column("create_time")]
        // 创建时间
        public DateTime CreateTime { get; set; }
        // 建立DeviceInfo与DeviceStatus表之间的1-to-many关系
        [ForeignKey("DeviceId")]
        public virtual DeviceStatus DeviceStatus { get; set; }
    }
    // device_slot_status表对应的数据模型
    [Table("device_slot_status")]
    public partial class DeviceSlotStatus
    {
        [Key]
        [Column("slot_id")]
        // 设备端口状态表的id
        public int Id { get; set; }
        [Column("status_id")]
        // 设备运行状态表id，引用DeviceStatus表的status_id
        public int StatusId { get; set; }
        [Column("slot_no")]
        // 端口号
        public int SlotNo { get; set; }
        [Column("slot_status")]
        // 端口状态，0为空闲，1为占用
        public bool SlotStatus { get; set; }
        [Column("update_time")]
        // 端口状态更新时间
        public DateTime UpdateTime { get; set; }
        [Column("create_time")]
        // 创建时间
        public DateTime CreateTime { get; set; }
        // 建立DeviceSlotStatus与DeviceStatus表之间的1-to-many关系
        [ForeignKey("StatusId")]
        public virtual DeviceStatus DeviceStatus { get; set; }
    }
    // device_status表对应的数据模型
    [Table("device_status")]
    public partial class DeviceStatus
    {
        [Key]
        [Column("status_id")]
        // 设备运行状态表id
        public int Id { get; set; }
        [Column("device_id")]
        // 设备id，引用DeviceInfo表的device_id
        public int DeviceId { get; set; }
        [Column("sim_id")]
        // 基站表id，引用SimInfo表的sim_id
        public int? SimId { get; set; }
        [Column("gl_id")]
        // 地理位置id，引用GLInfor表的gl_id
        public int? GlId { get; set; }
        [Column("device_state")]
        // 设备状态，0在线、1离线、2通电、3断电
        public int? DeviceState { get; set; }
        [Column("signal_val")]
        //设备网络模块信号强度，单位为dbm
        public int? SignalValue { get; set; }
        [Column("create_time")]
        // 创建时间
        public DateTime CreateTime { get; set; }
        // DeviceStatus表与DeviceInfo表之间的1-to-many关系
        [ForeignKey("DeviceId")]
        public virtual DeviceInfo DeviceInfo { get; set; }
        // DeviceStatus表与SimInfo表之间的1-to-1关系
        [ForeignKey("SimId")]
        public virtual SimInfo SimInfo { get; set; }
        // DeviceStatus表与GLInfor表之间的1-to-1关系
        [ForeignKey("GlId")]
        public virtual GLInfor GLInfor { get; set; }
        // DeviceStatus表与DeviceSlotStatus表之间的1-to-many关系
        public virtual ICollection<DeviceSlotStatus> DeviceSlotStatuses { get; set; }
    }
    [Table("district")]
    public partial class District
    {
        [Key]
        [Column("dist_id")]
        // 行政区域id
        public int Id { get; set; }
        [Column("city_id")]
        // 城市表ID，引用City表的city_id
        public int? CityId { get; set; }
        [Required]
        [Column("district_name", TypeName = "nvarchar(255)")]
        // 行政区域名称
        public string Name { get; set; }
        // 建立District与City表之间的1-to-many关系
        [ForeignKey("CityId")]
        public virtual City City { get; set; }
        // 建立District与GeoLocation表之间的1-to-many关系
        public virtual ICollection<GLInfor> GeoLocations { get; set; }
    }
    // error_info表对应的数据模型
    [Table("error_info")]
    public partial class ErrorInfo
    {
        [Key]
        [Column("error_id")]
        // 设备错误记录表id
        public int Id { get; set; }
        [Column("status_id")]
        // 设备运行状态表id，引用DeviceStatus表的status_id
        public int StatusId { get; set; }
        [Column("number_id")]
        // 错误编码ID，引用ErrorNumber表的errnum_id
        public int NumberId { get; set; }

        [Required]
        [Column("create_time")]
        // 创建时间
        public DateTime CreateTime { get; set; }
        // 建立ErrorInfo与DeviceStatus表之间的1-to-many关系
        [ForeignKey("StatusId")]
        public virtual DeviceStatus DeviceStatus { get; set; }
        // 建立ErrorInfo与ErrorNumber表之间的1-to-many关系
        [ForeignKey("NumberId")]
        public virtual ErrorNumber ErrorNumber { get; set; }
    }
    // error_number表对应的数据模型
    [Table("error_number")]
    public partial class ErrorNumber
    {
        [Key]
        [Column("errnum_id")]
        // 错误编码ID
        public int Id { get; set; }
        [Required]
        [Column("err_code", TypeName = "nvarchar(2)")]
        // 错误编码
        public string Code { get; set; }
        [Required]
        [Column("err_msg", TypeName = "nvarchar(50)")]
        // 编码解读
        public string Message { get; set; }
        [Required]
        [Column("create_time")]
        // 创建时间
        public DateTime CreateTime { get; set; }
        // 建立ErrorNumber与ErrorInfo表之间的1-to-many关系
        public virtual ICollection<ErrorInfo> ErrorInfos { get; set; }
    }
    [Table("gl_infor")]
    public partial class GLInfor
    {
        [Key]
        [Column("gl_id")]
        // 地理位置id
        public int Id { get; set; }
        [Required]
        [Column("pro_id")]
        // 具体地理位置id，引用Province表的pro_id
        public int ProvinceId { get; set; }
        [Required]
        [Column("rode", TypeName = "nvarchar(20)")]
        // 路段名称
        public string Road { get; set; }
        [Required]
        [Column("building", TypeName = "nvarchar(20)")]
        // 楼栋名称
        public string Building { get; set; }
        [Column("lo", TypeName = "decimal(10, 6)")]
        // 地球经度
        public decimal Longitude { get; set; }
        [Column("la", TypeName = "decimal(10, 6)")]
        // 地球纬度
        public decimal Latitude { get; set; }
        [Required]
        [Column("create_time")]
        // 创建时间
        public DateTime CreateTime { get; set; }
        // 建立GeolocationInformation与Province表之间的1-to-many关系
        [ForeignKey("ProvinceId")]
        public virtual Province Province { get; set; }
    }
    public partial class PayList
    {
        public int PayId { get; set; } // 自增id，支付流水号
        public int UserId { get; set; } // 外键，用户id
        public int SlotId { get; set; }  // 外键，端口表id，关联设备端口信息
        public int PwId { get; set; }  // 外键，功率套餐表id，关联付费的功率套餐
        public DateTime CreateTime { get; set; } // 记录的创建时间
        // 导航属性
        public DeviceSlotStatus DeviceSlotStatus { get; set; } // 表示导航属性，关联DeviceSlotStatus表
        public UserInfo User { get; set; } // 表示导航属性，关联User表
        public PowerPackage PowerPackage { get; set; }  // 表示导航属性，关联PowerPackage表
    }
    public partial class PayServiceTime
    {
        public int ServId { get; set; } // 自增id，服务计时表的id
        public int PayId { get; set; } // 外键，支付流水号id，引用PayList表的pay_id字段
        public DateTime BeginTime { get; set; } // 开始时间
        public DateTime? EndTime { get; set; } // 结束时间，通过powerPackage表的take_time数值计算结束时间
        public DateTime CreateTime { get; set; } // 记录的创建时间
        // 导航属性
        public PayList PayList { get; set; } // 表示导航属性，关联PayList表
    }
    public partial class PowerPackage
    {
        public int PwId { get; set; } // 自增id，功率套餐表id
        public int StatusId { get; set; } // 外键，设备运行状态表id
        public sbyte MinPw { get; set; } // 最小功率
        public sbyte MaxPw { get; set; } // 最大功率
        public sbyte RealMinPw { get; set; } // 真实最小功率
        public sbyte RaalMaxPw { get; set; } // 真实最大功率
        public decimal Price { get; set; } // 支付金额
        public float TakeTime { get; set; } // 设置等值的时间，半个小时时间为0.5
        public sbyte IsEnable { get; set; } // 套餐启用状态，0为启用，1为不启用
        public DateTime UpdateTime { get; set; } // 记录的更新时间
        public DateTime CreateTime { get; set; } // 记录的创建时间
        // 导航属性
        public DeviceStatus DeviceStatus { get; set; } // 表示导航属性，关联DeviceStatus表
    }
    public partial class Province
    {
        public int ProId { get; set; } // 自增id，省份表id
        public string ProName { get; set; } // 省份名称
        // 导航属性
        public ICollection<City> Cities { get; set; } // 表示导航属性，关联City表
    }
    public partial class ServicUseTime
    {
        public int UtId { get; set; } // 自增id，实际服务时间表id
        public int PayId { get; set; } // 外键，关联PayList表
        public DateTime BeginTime { get; set; } // 服务使用开始时间
        public DateTime? EndTime { get; set; } // 使用服务的真实结束时间
        public int UseMin { get; set; } // 实际服务使用时长,单位分钟
        public DateTime CreatTime { get; set; } // 记录的创建时间
        // 导航属性
        public PayList PayList { get; set; } // 表示导航属性，关联PayList表
    }
    public partial class SexInfo
    {
        public int SexId { get; set; } // 自增id，性别选项id
        public string SexName { get; set; } // 性别选项名称
        // 导航属性
        public ICollection<UserInfo> Users { get; set; } // 表示导航属性，关联Users表
    }
    public partial class SimInfo
    {
        public int SimId { get; set; } // 自增id，基站信息表的id
        public int CarrierId { get; set; } // 外键，关联CarrierInfo表
        public string FwVer { get; set; } // 固件版本
        public string Imei { get; set; } // 通讯模组唯一识别码
        public DateTime CreateTime { get; set; } // 创建时间
        // 导航属性
        public CarrierInfo CarrierInfo { get; set; } // 表示导航属性，关联CarrierInfo表
    }
    public partial class UserInfo
    {
        public int UserId { get; set; } // 自增id，用户信息表id
        public string LoginType { get; set; } // 登录方式，枚举类型，wx:微信，tel:手机号
        public string WxOpenid { get; set; } // 微信用户的openid，为空
        public string WxName { get; set; } // 微信昵称
        public string WxTel { get; set; } // 微信绑定的电话
        public int? WxSexId { get; set; } // 微信的性别，引用sexinfo表的sex_id
        public string Password { get; set; } // 登录类型为手机的用户的密码，PBKDF2算法加解密
        public DateTime CreateTime { get; set; } // 创建时间
        // 导航属性
        public SexInfo SexInfo { get; set; } // 表示导航属性，关联SexInfo表
    }
}
