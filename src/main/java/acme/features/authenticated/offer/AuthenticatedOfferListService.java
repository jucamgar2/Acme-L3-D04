
package acme.features.authenticated.offer;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.Offer;
import acme.framework.components.accounts.Authenticated;
import acme.framework.components.models.Tuple;
import acme.framework.helpers.MomentHelper;
import acme.framework.services.AbstractService;

@Service
public class AuthenticatedOfferListService extends AbstractService<Authenticated, Offer> {

	// Internal state ---------------------------------------------------------

	@Autowired
	protected AuthenticatedOfferRepository repository;

	// AbstractService interface ----------------------------------------------


	@Override
	public void check() {
		super.getResponse().setChecked(true);
	}

	@Override
	public void authorise() {
		super.getResponse().setAuthorised(true);
	}

	@Override
	public void load() {
		Collection<Offer> objects;
		final Date date = MomentHelper.getCurrentMoment();
		objects = this.repository.findAllOffers(date);
		super.getBuffer().setData(objects);
	}

	@Override
	public void unbind(final Offer object) {
		assert object != null;

		Tuple tuple;

		tuple = super.unbind(object, "heading", "summary", "price");

		super.getResponse().setData(tuple);
	}
}
