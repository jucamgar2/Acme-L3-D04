
package acme.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.URL;

import acme.framework.data.AbstractEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Banner extends AbstractEntity {

	// Serialisation identifier -----------------------------------------------

	protected static final long	serialVersionUID	= 1L;

	// Attributes -------------------------------------------------------------

	@NotNull
	@Temporal(value = TemporalType.TIMESTAMP)
	@PastOrPresent
	protected Date				instantiationMoment;

	@NotNull
	@Temporal(value = TemporalType.TIMESTAMP)
	protected Date				displayPeriodBegin;

	@NotNull
	@Temporal(value = TemporalType.TIMESTAMP)
	protected Date				displayPeriodFinish;

	@URL
	@NotBlank
	@Length(max = 255)
	protected String			pictureLink;

	@Length(max = 75)
	@NotBlank
	protected String			slogan;

	@URL
	@NotBlank
	@Length(max = 255)
	protected String			webLink;

	// Derived attributes -----------------------------------------------------

	// Relationships ----------------------------------------------------------

}
