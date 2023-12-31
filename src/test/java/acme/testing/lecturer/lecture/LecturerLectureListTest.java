
package acme.testing.lecturer.lecture;

import java.util.Collection;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvFileSource;
import org.springframework.beans.factory.annotation.Autowired;

import acme.entities.Lecture;
import acme.testing.TestHarness;

public class LecturerLectureListTest extends TestHarness {

	@Autowired
	LecturerLectureTestRepository repository;


	@ParameterizedTest
	@CsvFileSource(resources = "/lecturer/lecture/list-positive.csv", encoding = "utf-8", numLinesToSkip = 1)
	public void test100Positive(final int recordIndex, final String title, final String summary, final String estimatedLearningTime) {
		super.signIn("lecturer1", "lecturer1");
		super.clickOnMenu("Lecturer", "My courses");
		super.sortListing(0, "asc");
		super.clickOnListingRecord(23);
		super.clickOnButton("Lectures");
		super.checkListingExists();
		super.sortListing(0, "asc");
		super.checkColumnHasValue(recordIndex, 0, title);
		super.checkColumnHasValue(recordIndex, 1, summary);
		super.checkColumnHasValue(recordIndex, 2, estimatedLearningTime);
		super.signOut();
	}

	@Test
	public void test200Negative() {
		//No hay
	}

	@Test
	public void test300Hacking() {
		//Intentamos listar las lecciones de un curso sin ser profesores o sin ser el profesor creador de ese curso
		final Collection<Lecture> ls = this.repository.findManyLecturesByLecturerUsername("lecturer1");
		for (final Lecture l : ls) {
			final String param = String.format("masterId=%d", l.getId());
			super.checkLinkExists("Sign in");
			super.request("/lecturer/lecture/list", param);
			super.checkPanicExists();

			super.signIn("administrator", "administrator");
			super.request("/lecturer/lecture/list", param);
			super.checkPanicExists();
			super.signOut();

			super.signIn("auditor1", "auditor1");
			super.request("/lecturer/lecture/list", param);
			super.checkPanicExists();
			super.signOut();

			super.signIn("student1", "student1");
			super.request("/lecturer/lecture/list", param);
			super.checkPanicExists();
			super.signOut();

			super.signIn("company1", "company1");
			super.request("/lecturer/lecture/list", param);
			super.checkPanicExists();
			super.signOut();

			super.signIn("assistant1", "assistant1");
			super.request("/lecturer/lecture/list", param);
			super.checkPanicExists();
			super.signOut();
		}

	}

	@Test
	public void test301Hacking() {
		final Collection<Lecture> ls = this.repository.findManyLecturesByLecturerUsername("lecturer1");
		for (final Lecture l : ls) {
			final String param = String.format("masterId=%d", l.getId());
			super.checkLinkExists("Sign in");
			super.signIn("lecturer2", "lecturer2");
			super.request("/lecturer/lecture/list", param);
			super.checkPanicExists();
			super.signOut();

		}

	}

}
