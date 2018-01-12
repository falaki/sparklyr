% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ml_feature_word2vec.R
\name{ft_word2vec}
\alias{ft_word2vec}
\title{Feature Tranformation -- Word2Vec (Estimator)}
\usage{
ft_word2vec(x, input_col, output_col, vector_size = 100L, min_count = 5L,
  max_sentence_length = 1000L, num_partitions = 1L, step_size = 0.025,
  max_iter = 1L, seed = NULL, dataset = NULL,
  uid = random_string("word2vec_"), ...)
}
\arguments{
\item{x}{A \code{spark_connection}, \code{ml_pipeline}, or a \code{tbl_spark}.}

\item{input_col}{The name of the input column.}

\item{output_col}{The name of the output column.}

\item{vector_size}{The dimension of the code that you want to transform from words. Default: 100}

\item{min_count}{The minimum number of times a token must appear to be included in
the word2vec model's vocabulary. Default: 5}

\item{max_sentence_length}{(Spark 2.0.0+) Sets the maximum length (in words) of each sentence
in the input data. Any sentence longer than this threshold will be divided into
chunks of up to \code{max_sentence_length} size. Default: 1000}

\item{num_partitions}{Number of partitions for sentences of words. Default: 1}

\item{step_size}{Param for Step size to be used for each iteration of optimization (> 0).}

\item{max_iter}{The maximum number of iterations to use.}

\item{seed}{A random seed. Set this value if you need your results to be
reproducible across repeated calls.}

\item{dataset}{(Optional) A \code{tbl_spark}. If provided, eagerly fit the (estimator)
feature "transformer" against \code{dataset}. See details.}

\item{uid}{A character string used to uniquely identify the feature transformer.}

\item{...}{Optional arguments; currently unused.}
}
\value{
The object returned depends on the class of \code{x}.

\itemize{
  \item \code{spark_connection}: When \code{x} is a \code{spark_connection}, the function returns a \code{ml_transformer},
  a \code{ml_estimator}, or one of their subclasses. The object contains a pointer to
  a Spark \code{Transformer} or \code{Estimator} object and can be used to compose
  \code{Pipeline} objects.

  \item \code{ml_pipeline}: When \code{x} is a \code{ml_pipeline}, the function returns a \code{ml_pipeline} with
  the transformer or estimator appended to the pipeline.

  \item \code{tbl_spark}: When \code{x} is a \code{tbl_spark}, a transformer is constructed then
  immediately applied to the input \code{tbl_spark}, returning a \code{tbl_spark}
}
}
\description{
Word2Vec transforms a word into a code for further natural language processing or machine learning process.
}
\details{
When \code{dataset} is provided for an estimator transformer, the function
  internally calls \code{ml_fit()} against \code{dataset}. Hence, the methods for
  \code{spark_connection} and \code{ml_pipeline} will then return a \code{ml_transformer}
  and a \code{ml_pipeline} with a \code{ml_transformer} appended, respectively. When
  \code{x} is a \code{tbl_spark}, the estimator will be fit against \code{dataset} before
  transforming \code{x}.

  When \code{dataset} is not specified, the constructor returns a \code{ml_estimator}, and,
  in the case where \code{x} is a \code{tbl_spark}, the estimator fits against \code{x} then
  to obtain a transformer, which is then immediately used to transform \code{x}.
}
\seealso{
See \url{http://spark.apache.org/docs/latest/ml-features.html} for
  more information on the set of transformations available for DataFrame
  columns in Spark.

Other feature transformers: \code{\link{ft_binarizer}},
  \code{\link{ft_bucketizer}},
  \code{\link{ft_chisq_selector}},
  \code{\link{ft_count_vectorizer}}, \code{\link{ft_dct}},
  \code{\link{ft_elementwise_product}},
  \code{\link{ft_hashing_tf}}, \code{\link{ft_idf}},
  \code{\link{ft_imputer}},
  \code{\link{ft_index_to_string}},
  \code{\link{ft_interaction}}, \code{\link{ft_ngram}},
  \code{\link{ft_one_hot_encoder}}, \code{\link{ft_pca}},
  \code{\link{ft_quantile_discretizer}},
  \code{\link{ft_r_formula}},
  \code{\link{ft_regex_tokenizer}},
  \code{\link{ft_sql_transformer}},
  \code{\link{ft_stop_words_remover}},
  \code{\link{ft_string_indexer}},
  \code{\link{ft_tokenizer}},
  \code{\link{ft_vector_assembler}},
  \code{\link{ft_vector_slicer}}
}