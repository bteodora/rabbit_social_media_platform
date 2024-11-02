package rs.ac.uns.ftn.informatika.jpa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import rs.ac.uns.ftn.informatika.jpa.model.Post;
import rs.ac.uns.ftn.informatika.jpa.model.primer.Student;
import rs.ac.uns.ftn.informatika.jpa.repository.PostRepository;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@Service
public class PostService {

    private PostRepository postRepository;

    public PostService(@Autowired PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public Page<Post> findAllByProfileId(Pageable page, Integer profileId) {
        return postRepository.findAllByProfileId(profileId, page);
    }

    public List<Post> findAllActive() {
        return postRepository.findAll();
    }

    public Integer countPostsForProfile(Integer profileId) {
        return postRepository.countPostsForProfile(profileId);
    }

    public Integer countLikesForPost(Integer postId) {
        return postRepository.countLikesForPost(postId);
    }

    public Post save(Post post) {
        return postRepository.save(post);
    }

    public List<Post> findByProfileId(Integer profileId) {
        return postRepository.findAllByProfileId(profileId);
    }

    public void remove(Integer id) {
        postRepository.deleteById(id);
    }



    public Post updatePost(Integer id, Post updatedPost) {
        Optional<Post> existingPostOpt = postRepository.findById(id);

        if (existingPostOpt.isPresent()) {
            Post existingPost = existingPostOpt.get();
            existingPost.setPicture(updatedPost.getPicture());
            existingPost.setDeleted(updatedPost.isDeleted());
            existingPost.setDescription(updatedPost.getDescription());

            return postRepository.save(existingPost);
        } else {
            throw new EntityNotFoundException("Post with id " + id + " not found.");
        }
    }



}
