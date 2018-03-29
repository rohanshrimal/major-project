package model.springmodel;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import model.DomainContentModel;

@Entity
@Table(name="keyword")
public class Tags {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="kid" ,updatable = false, nullable = false)
	private int kid;
	
	@Column(name="kname")
	private String kname;
	
	@OneToOne
	@JoinColumn(name="did")
	private DomainContentModel domain;
	
	@ManyToMany
	@JoinTable(name="questionkeyword",joinColumns=@JoinColumn(name="kid"),inverseJoinColumns=@JoinColumn(name="qid"))
	private List<Question> questions;

	public int getKid() {
		return kid;
	}

	public void setKid(int kid) {
		this.kid = kid;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
	}

	public DomainContentModel getDomain() {
		return domain;
	}

	public void setDomain(DomainContentModel domain) {
		this.domain = domain;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	@Override
	public String toString() {
		return "Tags [kid=" + kid + ", kname=" + kname + ", domain=" + domain + "]";
	}
	
	

}
