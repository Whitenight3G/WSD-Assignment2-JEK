package uts.wsd;
import java.io.*;
import javax.xml.bind.*;

public class StudentApp  implements Serializable{

	private String filePath;
    private Students students;
    
	public StudentApp(String filePath, Students students) {
		super();
		this.filePath = filePath;
		this.students = students;
	}
    
    public StudentApp() {
		// TODO Auto-generated constructor stub
	}
    
    public void updateXML(Students students, String filePath) throws Exception {
        this.students = students;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(students, fout);
        fout.close();
    }
    
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) throws Exception{
		JAXBContext jc = JAXBContext.newInstance(Students.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        students = (Students) u.unmarshal(fin); 		
        fin.close();
	}
	
	public Students getStudents() {
		System.out.println("xxxxxxxxxxxxx");
		return students;
	}

	public void setStudents(Students students) {
		this.students = students;
	}
    
	public void saveStudents() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(students, fout);
        fout.close();
    }
    
    
    
}
