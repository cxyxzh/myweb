package com.xzh.web.domain;

import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

@Data
public class ItemCat implements Serializable {
    private Long id;
    @NotBlank
    private String name;
    private int status;
    @NotNull
    private Integer sortOrder;

    private Boolean isParent;
    private Date created;
    private Date updated;
    private ItemCat parentItemCat;

}
