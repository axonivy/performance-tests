
package performance.client;

import java.io.Serializable;
import javax.annotation.Generated;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


/**
 * <p>Java class for compositeObject complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="compositeObject">
 *   &lt;complexContent>
 *     &lt;extension base="{http://performance/}nestedObject">
 *       &lt;sequence>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "compositeObject")
@XmlSeeAlso({
    Person.class
})
@Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
public abstract class CompositeObject
    extends NestedObject
    implements Serializable
{

    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    private final static long serialVersionUID = 1L;

    @Override
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

    @Override
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    public boolean equals(Object that) {
        return EqualsBuilder.reflectionEquals(this, that);
    }

    @Override
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    public int hashCode() {
        return HashCodeBuilder.reflectionHashCode(this);
    }

}
