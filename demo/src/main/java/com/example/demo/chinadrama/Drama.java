package com.example.demo.chinadrama;

public class Drama {
	private int no;
	private String title;
	private int episodes;
	private String casting;
	private String broadcaster;
	private String content;
	
	public Drama() { }

	public Drama(int no, String title, int episodes, String casting, String broadcaster, String content) {
		this.no = no;
		this.title = title;
		this.episodes = episodes;
		this.casting = casting;
		this.broadcaster = broadcaster;
		this.content = content;
	}

	@Override
	public String toString() {
		return "Drama [no=" + no + ", title=" + title + ", episodes=" + episodes + ", casting=" + casting
				+ ", broadcaster=" + broadcaster + ", content=" + content + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getEpisodes() {
		return episodes;
	}

	public void setEpisodes(int episodes) {
		this.episodes = episodes;
	}

	public String getCasting() {
		return casting;
	}

	public void setCasting(String casting) {
		this.casting = casting;
	}

	public String getBroadcaster() {
		return broadcaster;
	}

	public void setBroadcaster(String broadcaster) {
		this.broadcaster = broadcaster;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	

}
