import json

import requests

from medium_models import Image, Post, to_dict

try:
    from urllib.parse import urlencode
except ImportError:
    from urllib import urlencode


BASE_PATH = "https://medium.com/"
ESCAPE_CHARACTERS = "])}while(1);</x>"


class Medium(object):
    def get_publication_posts(self, publication_name, count=10):
        return self._send_post_request(
            BASE_PATH + "{0}/latest?limit={count}".format(publication_name,
                                                          count=count))

    @staticmethod
    def _send_request(url, parse_function):
        req = requests.get(url, headers={"Accept": "application/json"})
        # print(url, req.status_code)
        if req.status_code == requests.codes.ok:
            return parse_function(
                json.loads(req.text.replace(ESCAPE_CHARACTERS, "").strip()))
        else:
            return None

    @staticmethod
    def _send_post_request(url):
        return Medium._send_request(url, Medium.parse_post)

    @staticmethod
    def parse_images(image_dict, return_dict=False):
        if image_dict is not None:
            image_id = image_dict["imageId"] if "imageId" in image_dict else \
                image_dict["id"]
            if image_id:
                image = Image(image_id)
                image.original_width = image_dict["originalWidth"]
                image.original_height = image_dict["originalHeight"]

                image.url = u"https://cdn-images-1.medium.com/max/800/{id}" \
                    .format(width=image.original_width,
                            height=image.original_height,
                            id=image.image_id)
                if return_dict:
                    return to_dict(image)
                else:
                    return image
            else:
                return None

    @staticmethod
    def parse_post(payload, return_dict=False):
        # get the different parsing keys
        post_detail_parsing_keys = ("payload", "references", "Post")
        if post_detail_parsing_keys is None:
            return
        post_list_payload = payload
        for key in post_detail_parsing_keys:
            post_list_payload = post_list_payload.get(key)

        if post_list_payload is None:
            post_detail_parsing_keys = ("payload", "posts")
            post_list_payload = payload
            for key in post_detail_parsing_keys:
                post_list_payload = post_list_payload.get(key)

        def parse_post_dict(post_dict, post_id=None):
            if post_id is None:
                post_id = post_dict["id"]
            post = Post(post_id)
            unique_slug = post_dict["uniqueSlug"]
            title = post_dict["title"]
            post_date = post_dict["createdAt"]

            # print(post_date)
            publication_id = post_dict["approvedHomeCollectionId"]

            url = BASE_PATH
            ref_dict = payload["payload"]["references"]
            if publication_id is not None and publication_id:
                publication_dict = ref_dict["Collection"][publication_id]
                # custom publication domain
                if "domain" in publication_dict and publication_dict["domain"]:
                    url = "https://" + publication_dict["domain"]
                else:
                    # simple publication
                    url += publication_dict["slug"]
            else:
                # personal post, no publication
                creator_id = post_dict["creatorId"]
                username = ref_dict["User"][creator_id]["username"]
                url += "@{username}".format(username=username)
            url += u"/{path}".format(path=unique_slug)

            virtual_dict = post_dict["virtuals"]
            recommend_count = virtual_dict["recommends"]
            response_count = virtual_dict["responsesCreatedCount"]
            read_time = virtual_dict["readingTime"]
            word_count = virtual_dict["wordCount"]
            clap_count = virtual_dict["totalClapCount"]
            image_count = virtual_dict["imageCount"]
            preview_image = virtual_dict["previewImage"]
            subtitle = virtual_dict["subtitle"]
            # post_tags = virtual_dict["tags"]
            # post.post_tags = parse_tags(post_tags, return_dict)

            # post.unique_slug = unique_slug
            post.title = title
            post.subtitle = subtitle
            post.post_date = post_date
            post.url = url
            post.clap_count = clap_count
            post.recommend_count = recommend_count
            post.response_count = response_count
            post.read_time = read_time
            post.word_count = word_count
            post.image_count = image_count
            image = Medium.parse_images(preview_image, return_dict)
            if image is not None:
                post.preview_image = image

            if return_dict:
                return to_dict(post)
            else:
                return post

        post_list = []
        # print(post_list_payload)
        # payload -> references -> Post
        if type(post_list_payload) is dict:
            for post_id in post_list_payload.keys():
                post_dict = post_list_payload.get(post_id)
                post_list.append(parse_post_dict(post_dict, post_id))
        # payload -> value
        elif type(post_list_payload) is list:
            for post_dict in post_list_payload:
                post_list.append(parse_post_dict(post_dict))

        return post_list
