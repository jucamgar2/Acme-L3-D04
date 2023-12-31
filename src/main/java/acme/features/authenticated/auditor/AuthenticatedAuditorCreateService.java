
package acme.features.authenticated.auditor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.components.AuxiliarService;
import acme.framework.components.accounts.Authenticated;
import acme.framework.components.accounts.Principal;
import acme.framework.components.accounts.UserAccount;
import acme.framework.components.models.Tuple;
import acme.framework.controllers.HttpMethod;
import acme.framework.helpers.PrincipalHelper;
import acme.framework.services.AbstractService;
import acme.roles.Auditor;

@Service
public class AuthenticatedAuditorCreateService extends AbstractService<Authenticated, Auditor> {
	// Internal state ---------------------------------------------------------

	@Autowired
	protected AuthenticatedAuditorRepository	repository;

	@Autowired
	protected AuxiliarService					auxiliarService;

	// AbstractService interface ----------------------------------------------


	@Override
	public void check() {
		super.getResponse().setChecked(true);
	}

	@Override
	public void authorise() {
		boolean status;

		status = !super.getRequest().getPrincipal().hasRole(Auditor.class);

		super.getResponse().setAuthorised(status);
	}

	@Override
	public void load() {
		Auditor object;
		Principal principal;
		int userAccountId;
		UserAccount userAccount;

		principal = super.getRequest().getPrincipal();
		userAccountId = principal.getAccountId();
		userAccount = this.repository.findUserAccountById(userAccountId);

		object = new Auditor();
		object.setUserAccount(userAccount);

		super.getBuffer().setData(object);
	}

	@Override
	public void bind(final Auditor object) {
		assert object != null;

		super.bind(object, "firm", "professionalId", "certifications", "furtherInformationLink");
	}

	@Override
	public void validate(final Auditor object) {
		assert object != null;
		if (!super.getBuffer().getErrors().hasErrors("professionalId"))
			super.state(this.repository.findAuditorByProfId(object.getProfessionalId()) == null, "professionalId", "authenticated.auditor.form.error.professionalId");

		if (!super.getBuffer().getErrors().hasErrors("firm"))
			super.state(this.auxiliarService.validateTextImput(object.getFirm()), "firm", "authenticated.auditor.form.error.spam");

		if (!super.getBuffer().getErrors().hasErrors("professionalId"))
			super.state(this.auxiliarService.validateTextImput(object.getProfessionalId()), "professionalId", "authenticated.auditor.form.error.spam");

		if (!super.getBuffer().getErrors().hasErrors("certifications"))
			super.state(this.auxiliarService.validateTextImput(object.getCertifications()), "certifications", "authenticated.auditor.form.error.spam");

	}

	@Override
	public void perform(final Auditor object) {
		assert object != null;
		this.repository.save(object);
	}

	@Override
	public void unbind(final Auditor object) {
		assert object != null;

		final Tuple tuple;

		tuple = super.unbind(object, "firm", "professionalId", "certifications", "furtherInformationLink");

		super.getResponse().setData(tuple);
	}

	@Override
	public void onSuccess() {
		if (super.getRequest().getMethod().equals(HttpMethod.POST))
			PrincipalHelper.handleUpdate();
	}
}
