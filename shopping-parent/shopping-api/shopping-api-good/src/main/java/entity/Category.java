package entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@ToString(exclude = {"type", "weight", "created", "author", "updated", "last_modifier"})
public class Category implements Serializable {
	private static final long serialVersionUID = 3709221101808621067L;
	/** id<br>顶级节点：0 <br>一级节点：4位数 <br>二级节点： 8位数 <br>三级节点： 12位数*/
	private Long cgy_id;
	/** 父节点id，也是本节点id的前缀 */
	private Long p_cgy_id;
	/** 分类标题 */
	private String title;
	/** 代码 */
	private String code;
	/** 等级 */
	private int level;
	/** 商品类型 */
	private String type;
	/** 排序权重 */
	private Integer weight;
	/** 创建日期 */
	private Date created;
	/** 创建人 */
	private String author;
	/** 最后修改日期 */
	private Date updated;
	/** 最后修改人 */
	private String last_modifier;
	/** 是否上线 */
	private boolean is_active;
}
