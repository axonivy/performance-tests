
package performance.client;

import java.io.Serializable;
import javax.annotation.Generated;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


/**
 * <p>Java class for person complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="person">
 *   &lt;complexContent>
 *     &lt;extension base="{http://performance/}compositeObject">
 *       &lt;sequence>
 *         &lt;element name="firstName" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="lastName" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "person", propOrder = {
    "firstName",
    "id",
    "lastName"
})
@Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
public class Person
    extends CompositeObject
    implements Serializable
{

    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    private final static long serialVersionUID = 1L;
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    protected String firstName;
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    protected String id;
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    protected String lastName;

    /**
     * Gets the value of the firstName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    public String getFirstName() {
        return firstName;
    }

    /**
     * Sets the value of the firstName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    public void setFirstName(String value) {
        this.firstName = value;
    }

    /**
     * Gets the value of the id property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    public String getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    public void setId(String value) {
        this.id = value;
    }

    /**
     * Gets the value of the lastName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    public String getLastName() {
        return lastName;
    }

    /**
     * Sets the value of the lastName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    @Generated(value = "com.sun.tools.xjc.Driver", date = "2020-06-09T08:48:51+02:00", comments = "JAXB RI v2.2.11")
    public void setLastName(String value) {
        this.lastName = value;
    }

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
