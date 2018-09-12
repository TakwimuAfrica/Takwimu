from requests_aws4auth import AWS4Auth

# https://github.com/sam-washington/requests-aws4auth/issues/24#issue-176579742


class AWS4AuthNotUnicode(AWS4Auth):
    def __call__(self, req):
        req = super(AWS4AuthNotUnicode, self).__call__(req)
        req.headers = {str(name): value for name, value in req.headers.items()}
        return req