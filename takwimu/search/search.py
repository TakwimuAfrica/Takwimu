import string

from .takwimu_search import TakwimuTopicSearch


def search(query):
    operator = 'or'
    strip_chars = string.whitespace
    if query.startswith('"') and query.endswith('"'):
        # search in quotes means phrase search
        operator = 'and'
        strip_chars += '"'

    search_query = query.strip(strip_chars)
    return TakwimuTopicSearch().search(search_query, operator, size=50)


def suggest(prefix):
    operator = 'or'
    strip_chars = string.whitespace
    if prefix.startswith('"') and prefix.endswith('"'):
        # search in quotes means phrase search
        operator = 'and'
        strip_chars += '"'

    query_string = prefix.strip(strip_chars)
    results = TakwimuTopicSearch().search(query_string=query_string,
                                          operator=operator,
                                          query_type='phrase_prefix',
                                          query_fields=['title'], size=10)
    unique_titles = set([r.get('title') for r in results])
    return [{"title": t} for t in unique_titles]
